//
//  RecordViewController.m
//  Timer-Count
//
//  Created by Takumi ITO on 2013/12/06.
//  Copyright (c) 2013年 Takumi ITO. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

@synthesize score;
@synthesize Record;
@synthesize name;
@synthesize button_n;
@synthesize Total;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


    
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //NSLog(@"%04d" ,self.score);
    
    
    
    
    //ここから 画像表示。scoreに応じて画像が異なる
         //scoreが25より小さかったら マティーニの画像を表示
    
    CGRect rect = CGRectMake(35, 40, 250, 300);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    
    if (self.button_n == 1){
        if (self.score <= 20){
        	imageView.image = [UIImage imageNamed:@"bluemoon_1.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ブルームーン";
        	NSLog(@"ブルームーン");
        }else if ( 20 < self.score <= 40){
        	imageView.image = [UIImage imageNamed:@"ginlime_2.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ジンライム";
            NSLog(@"ジンライム");
            
        }else if ( 40 < self.score <= 60){
        	imageView.image = [UIImage imageNamed:@"gintonic_3.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ジントニック";
            NSLog(@"ジントニック");
            
            
        }else if ( 60 < self.score  <= 80){
            imageView.image = [UIImage imageNamed:@"gimlet_4.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ギムレット";
            NSLog(@"ギムレット");
        }else{
            imageView.image = [UIImage imageNamed:@"martini_5.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"マティーニ";
            NSLog(@"マティーニ");
        }
    }else if (self.button_n == 2){
        if (self.score <= 20){
            imageView.image = [UIImage imageNamed:@"bonbon_1.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ウィスキーボンボン";
        	NSLog(@"ウィスキーボンボン");
        }else if (20 < self.score <= 40){
            imageView.image = [UIImage imageNamed:@"scotchkilt_2.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"スコッチキルト";
            NSLog(@"スコッチキルト");
        }else if (40 < self.score <= 60){
        	imageView.image = [UIImage imageNamed:@"mint_3.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ミントジュレップ";
            NSLog(@"ミントジュレップ");
        }else if (60 < self.score  <= 80){
        	imageView.image = [UIImage imageNamed:@"whiskysoda_4.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ウィスキーソーダ";
            NSLog(@"ウィスキーソーダ");
        }else{
            imageView.image = [UIImage imageNamed:@"irish_coffee_5.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"アイリッシュコーヒー";
            NSLog(@"アイリッシュコーヒー");
        }
    }else if (self.button_n == 3){
        if (self.score <= 20){
        	imageView.image = [UIImage imageNamed:@"bluetrip_1.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ブルートリップ";
        	NSLog(@"ブルートリップ");
        }else if (20 < self.score <= 40){
        	imageView.image = [UIImage imageNamed:@"sunrise_2.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"テキーラサンライズ";
            NSLog(@"テキーラサンライズ");
        }else if (40 < self.score <= 60){
        	imageView.image = [UIImage imageNamed:@"matador_3.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"マタドール";
            NSLog(@"マタドール");
        }else if (60 < self.score  <= 80){
            imageView.image = [UIImage imageNamed:@"risingsun_4.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"ライジングサン";
            NSLog(@"ランジングサン");
        }else{
            imageView.image = [UIImage imageNamed:@"margarita_5.jpg"];
        	[self.view addSubview:imageView];
            name.text = @"マルガリータ";
            NSLog(@"マルガリータ");
        }
	}

    //ここまでが画像表示

    
    
    Record.text = [NSString stringWithFormat:@"%04d", self.score];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"0000" forKey:@"total"];
    [ud registerDefaults:defaults];
    [ud setInteger:self.score + [ud integerForKey:@"total"] forKey:@"total"];
    [ud synchronize];
    NSLog(@"%ld", (long)[ud integerForKey:@"total"]);
    Total.text = [NSString stringWithFormat:@"%04ld", (long)[ud integerForKey:@"total"]];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
