//
//  ViewController.m
//  cocktail_shaker
//
//  Created by Takumi ITO on 2014/01/17.
//  Copyright (c) 2014年 Takumi ITO. All rights reserved.
//

#import "ViewController.h"
#import "Chose.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Chose *no = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"button1"]){
        no.button_no = 1;
    }else if ([[segue identifier] isEqualToString:@"button2"]){
        no.button_no = 2;
    }else if ([[segue identifier] isEqualToString:@"button3"]){
        no.button_no = 3;
    }
}

@end
