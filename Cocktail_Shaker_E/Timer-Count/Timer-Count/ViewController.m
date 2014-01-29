//
//  ViewController.m
//  Timer-Count
//
//  Created by Takumi ITO on 2013/12/05.
//  Copyright (c) 2013年 Takumi ITO. All rights reserved.
//

#import "ViewController.h"
#import "RecordViewController.h"
#import "FrameByFrameAnimation.h"
#import "Chose.h"

UIImageView *imageView_;
UIImageView *imageView2_;



int c=0;
int Score=0;
int check=1;
@implementation ViewController
@synthesize time;
@synthesize btn;
@synthesize count;
@synthesize button_no;

@synthesize soundURL;
@synthesize soundID;


SystemSoundID soundTest;


//アニメーションのフレームレート
float const _animationFps = 12.0f;
//アニメーションのリピート回数を無限に指定
NSInteger _animationRepeatNum = 0;
//アニメーションの座標・寸法指定
NSInteger _animationImageX;
NSInteger _animationImageY;
NSInteger const _animationImageWidth = 200;
NSInteger const _animationImageHeight = 200;


- (IBAction)toRecord:(id)sender{
    if([time.text isEqual: @"5.00"]){
        //音を鳴らす準備
        
        NSString *testSound = [[NSBundle mainBundle] pathForResource:@"hit_sound" ofType:@"mp3"];
        NSURL *urlOfTestSound = [NSURL fileURLWithPath:testSound];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)urlOfTestSound, &soundTest);
        
        
        //これも音楽　シャカシャカ
        CFBundleRef mainBundle;
        mainBundle = CFBundleGetMainBundle ();
        soundURL  = CFBundleCopyResourceURL (mainBundle,CFSTR ("test"),CFSTR ("mp3"),NULL);
        AudioServicesCreateSystemSoundID (soundURL, &soundID);
        CFRelease (soundURL);
 
        c = 0;
        count.text = @"0000";
        timeTicker = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(showActivity) userInfo:nil repeats:YES];
    }
}

-(void)showActivity{
    //[btn setEnabled:NO];
    btn.hidden = YES;
    float currentTime = [time.text floatValue];
    
    float displayTime = currentTime - 0.01;
    //NSLog(@"%.2f", displayTime);
    time.text = [NSString stringWithFormat:@"%.2f", displayTime];//%.2fは少数点第二位
    //↑は標準入力
    float endTime = [time.text floatValue];
    
    if(endTime == 0.00){
        check=0;
        time.text = @"0.00";
        [timeTicker invalidate];
        Score = c;
        //[btn setEnabled:YES];
        btn.hidden = NO;
        //[btn setTitle:@"End" forState:UIControlStateNormal];
        
        
        [self performSegueWithIdentifier:@"toRecord" sender:(self)];
    }
    
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)viewDidLoad {
    //NSLog(@"hoge");
    check=1;
    [super viewDidLoad];
    [self startAnimationImage];
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0/15)];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    const float violence = 5.5;
    static BOOL beenhere;
    BOOL shake = FALSE;
    
    if (beenhere) return;
    beenhere = TRUE;
    /*if (acceleration.x > violence || acceleration.x < -1*violence){
     c++;
     AudioServicesPlaySystemSound (soundID);
     count.text = [NSString stringWithFormat:@"%04d", c];
     shake = TRUE;
     }*/
    if (acceleration.y > violence || acceleration.y < -1*violence){
        c++;
        if(check==1){
            AudioServicesPlaySystemSound (soundID);
        }
        count.text = [NSString stringWithFormat:@"%04d", c];
        shake = TRUE;
        //NSLog(@"hogeY");
    }
    /*if (acceleration.z > violence || acceleration.z < -1*violence){
     c++;
     AudioServicesPlaySystemSound (soundID);
     count.text = [NSString stringWithFormat:@"%04d", c];
     
     shake = TRUE;
     }*/
    if (shake) {
        if(check==1){
            AudioServicesPlaySystemSound (soundID);
            NSLog(@"shake");
            NSLog(@"check=%d",check);
        }
    }
    beenhere = FALSE;
}
    
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
   
    c++;
    if(check==1){
        AudioServicesPlaySystemSound (soundID);
    }
    count.text = [NSString stringWithFormat:@"%04d", c];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"%d",c);
    RecordViewController *vc = [segue destinationViewController];
    vc.score = Score;
    if (self.button_no == 1){
        vc.button_n = 1;
    }else if (self.button_no == 2){
        vc.button_n = 2;
    }else if (self.button_no == 3){
        vc.button_n = 3;
    }
    //NSLog(@"%d",vc.score);
}

- (void)startAnimationImage
{
    //クラス初期化
    FrameByFrameAnimation *fbfAnimation = [[FrameByFrameAnimation alloc] init];
    //アニメーションの総フレーム数
    NSInteger animationFrames = 4;
    //アニメーションファイルの接頭詞
    NSString *animationPrefix = @"shaker";
    //アニメーションをセンターに配置
    
    NSInteger _animationImageX = (self.view.frame.size.width /2) - (_animationImageWidth / 2);
    NSInteger _animationImageY = (self.view.frame.size.height /2) - (_animationImageHeight / 2);
    
    //アニメーション開始
    [fbfAnimation setAnimating:animationFrames
                              :animationPrefix
                              :[self animationSeconds:animationFrames]
                              :_animationRepeatNum
                              :_animationImageX
                              :_animationImageY
                              :_animationImageWidth
                              :_animationImageHeight];
    //ステージに追加
    [self.view addSubview:[fbfAnimation animationImageView]];
}

//アニメーション秒数を取得
- (float)animationSeconds:(NSInteger)animationFrames
{
    return (animationFrames / _animationFps);
}

- (IBAction)goback:(UIStoryboardSegue *)segue{}
    
@end
