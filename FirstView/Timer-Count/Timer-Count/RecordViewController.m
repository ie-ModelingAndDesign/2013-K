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
