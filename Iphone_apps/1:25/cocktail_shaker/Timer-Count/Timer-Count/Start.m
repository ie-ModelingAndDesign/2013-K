//
//  Start.m
//  Timer-Count
//
//  Created by Takumi ITO on 2014/01/25.
//  Copyright (c) 2014年 Takumi ITO. All rights reserved.
//

#import "Start.h"

@interface Start ()

@end

@implementation Start

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
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    Total.text = [NSString stringWithFormat:@"%04ld", (long)[ud integerForKey:@"total"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
