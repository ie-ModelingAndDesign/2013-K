//
//  ViewController.m
//  Squat
//
//  Created by 敦史 掛川 on 12/02/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

// 減速しているとみなすユーザー加速度の大きさの閾値
static const double kUserAccelerationThreshold = 0.15;
// 立ち・座りが成立する減速継続時間
static const float kDecelerationTime = 0.2;

@implementation ViewController

@synthesize label;
@synthesize button;
@synthesize arrowImage;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初期化
    isCounting = NO;
    isDecelerationStarted = NO;
    [self changeViewState];

    // CMMotionManagerを作成
    motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = 0.1;
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setButton:nil];
    [self setArrowImage:nil];
    motionManager = nil;
    if (timer && timer.isValid)
    {
        [timer invalidate];
    }
    timer = nil;
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Private methods

- (void)changeViewState
{
    if (isCounting)
    {
        [button setTitle:@"ストップ" forState:UIControlStateNormal];
        arrowImage.hidden = NO;
    }
    else
    {
        [button setTitle:@"スタート" forState:UIControlStateNormal];
        arrowImage.hidden = YES;
        self.label.text = nil;
    }
}

- (void)startCounting
{    
    // モーションデータ更新時のハンドラを作成
    void (^handler)(CMDeviceMotion *, NSError *) = ^(CMDeviceMotion *motion, NSError *error)
    {
        // ユーザー加速度の重力方向の大きさを算出
        double magnitude = [self gravityDirectionMagnitudeForMotion:motion];
        // 算出したユーザー加速度の重力方向の大きさからスクワットの動きを判定
        [self validateGravityDirectionMagnitude:magnitude];
    };
 
    // モーションデータの測定を開始
    NSOperationQueue *queue = [NSOperationQueue currentQueue];
    [motionManager startDeviceMotionUpdatesToQueue:queue withHandler:handler];
    
    count = 0;
    isCounting = YES;
    [self changeViewState];
    
    isSitting = YES;
    [self updateViewAnimated:NO];
}

- (void)stopCounting
{
    // モーションデータの測定を終了
    [motionManager stopDeviceMotionUpdates];

    if (timer.isValid)
    {
        [timer invalidate];
    }
    
    isCounting = NO;
    [self changeViewState];
}

- (void)rotateArrowImage
{
    // 立ちフェーズの場合は上向きに反転
    CGFloat rotation = isSitting ? 0.0f : M_PI;
    arrowImage.transform = CGAffineTransformMakeRotation(rotation);
}

- (void)updateViewAnimated:(BOOL)animated
{
    // カウント回数ラベルの更新
    label.text = [NSString stringWithFormat:@"%d回", count];
    
    // 矢印イメージの更新
    if (animated)
    {
        [UIView animateWithDuration:0.3 animations:^{
            [self rotateArrowImage];
        }];
    }
    else
    {
        [self rotateArrowImage];
    }
}

- (double)gravityDirectionMagnitudeForMotion:(CMDeviceMotion *)motion
{
    // ユーザー加速度の測定値を取得
    CMAcceleration user = motion.userAcceleration;
    // 重力加速度の測定値を取得
    CMAcceleration gravity = motion.gravity;
    
    // ユーザー加速度の大きさを算出
    double magnitude = sqrt(pow(user.x, 2) + pow(user.y, 2) + pow(user.z, 2));
    
    // ユーザー加速度のベクトルと重力加速度のベクトルのなす角θのcosθを算出
    // 空間ベクトルのなす角の式を利用
    double cosT = (user.x * gravity.x + user.y * gravity.y + user.z * gravity.z) / 
    sqrt((pow(user.x, 2) + pow(user.y, 2) + pow(user.z, 2)) * 
    (pow(gravity.x, 2) + pow(gravity.y, 2) + pow(gravity.z, 2)));
    
    // ユーザー加速度の大きさにcosθを乗算してユーザー加速度の重力方向における大きさを算出し、小数点第三位で丸める
    double gravityDirectionMagnitude = round(magnitude * cosT * 100) / 100;
    
    return gravityDirectionMagnitude;
}

- (void)validateGravityDirectionMagnitude:(double)magnitude
{
    if (timer.isValid)
    {
        // 立ち判定もしくは座り判定中の場合
        if ((!isSitting && isDecelerationStarted && magnitude > -kUserAccelerationThreshold) || 
            (isSitting && isDecelerationStarted && magnitude < kUserAccelerationThreshold))
        {
            // ユーザー加速度の重力方向における大きさが閾値を下回る場合、判定をキャンセル
            [timer invalidate];
            timer = nil;
            NSLog(@"timer is canceled.");
        }
    }
    else
    {
        if (!isSitting && magnitude < -kUserAccelerationThreshold)
        {
            // 立ちフェーズかつユーザー加速度の重力方向における大きさが閾値を上回る場合、立ち判定スタート
            // 一定時間閾値を上回っていた場合に、立ち判定成立
            timer = [NSTimer scheduledTimerWithTimeInterval:kDecelerationTime 
                                                     target:self 
                                                   selector:@selector(timerHandler:) 
                                                   userInfo:nil 
                                                    repeats:NO];
            isDecelerationStarted = YES;
            NSLog(@"standing timer start.");
        }
        else if (isSitting && magnitude > kUserAccelerationThreshold)
        {
            // 座りフェーズかつユーザー加速度の重力方向における大きさが閾値を上回る場合、座り判定スタート
            // 一定時間閾値を上回っていた場合に、座り判定成立
            timer = [NSTimer scheduledTimerWithTimeInterval:kDecelerationTime 
                                                     target:self 
                                                   selector:@selector(timerHandler:) 
                                                   userInfo:nil 
                                                    repeats:NO];
            isDecelerationStarted = YES;
            NSLog(@"sitting timer start.");
        }
    }
}

#pragma mark - Handlers

- (void)timerHandler:(NSTimer *)aTimer
{
    NSLog(@"timer completed");
    if (isSitting)
    {
        // 座り判定成立、立ちフェーズへ
        isSitting = NO;
        [self updateViewAnimated:YES];
        NSLog(@"switch to standing.");
    }
    else
    {
        // 立ち判定成立、座りフェーズへ
        isSitting = YES;
        count++;
        [self updateViewAnimated:YES];
        NSLog(@"switch to sitting.");
    }
    
    isDecelerationStarted = NO;
    timer = nil;
}

- (IBAction)buttonPressed:(id)sender
{
    // デバイスのハードウェアチェック
    /*if (!motionManager.deviceMotionAvailable)
    {
        NSLog(@"DeviceMotion is not available");
        return;
    }*/
    
    if (isCounting)
    {
        // カウント終了
        [self stopCounting];
    }
    else
    {
        // カウント開始
        [self startCounting];
    }
}
@end
