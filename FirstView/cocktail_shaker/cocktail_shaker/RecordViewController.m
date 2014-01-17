//
//  RecordViewController.m
//  cocktail_shaker
//
//  Created by Takumi ITO on 2014/01/17.
//  Copyright (c) 2014年 Takumi ITO. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

@synthesize score;
@synthesize Record;
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
    Record.text = [NSString stringWithFormat:@"%04d", self.score];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"0000" forKey:@"total"];
    [ud registerDefaults:defaults];
    [ud setInteger:self.score + [ud integerForKey:@"total"] forKey:@"total"];
    [ud synchronize];
    NSLog(@"%ld", (long)[ud integerForKey:@"total"]);
    Total.text = [NSString stringWithFormat:@"%04ld", (long)[ud integerForKey:@"total"]];
    
    if (self.button_n == 1){
        if (self.score <= 20){
            NSLog(@"1");
        }else if (self.score <= 40){
            NSLog(@"2");
        }else if (self.score <= 60){
            NSLog(@"3");
        }else{
            NSLog(@"4");
        }
    }else if (self.button_n == 2){
        if (self.score <= 20){
            NSLog(@"5");
        }else if (self.score <= 40){
            NSLog(@"6");
        }else if (self.score <= 60){
            NSLog(@"7");
        }else{
            NSLog(@"8");
        }
    }else if (self.button_n == 3){
        if (self.score <= 20){
            NSLog(@"9");
        }else if (self.score <= 40){
            NSLog(@"10");
        }else if (self.score <= 60){
            NSLog(@"11");
        }else{
            NSLog(@"12");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
