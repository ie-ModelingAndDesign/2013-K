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
    if(self.score<25){
        CGRect rect = CGRectMake(35, 40, 250, 300);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
        
        // 画像の読み込み
        imageView.image = [UIImage imageNamed:@"cocktail1.jpg"];
        
        // UIImageViewのインスタンスをビューに追加
        [self.view addSubview:imageView];
    }
        //scoreが25以上50以下なら ミントジュレップの画像を表示
    if(self.score>=25 && self.score<=50){
        CGRect rect = CGRectMake(35, 40, 250, 300);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
        
        // 画像の読み込み
        imageView.image = [UIImage imageNamed:@"cocktail2.jpg"];
        
        // UIImageViewのインスタンスをビューに追加
        [self.view addSubview:imageView];
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
