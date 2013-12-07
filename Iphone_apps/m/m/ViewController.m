//
//  ViewController.m
//  m
//
//  Created by たかひろ　あふそ on 2013/12/05.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize count;

int c;

-(IBAction) clear:(id) sender{
    count.text = @"0回";
    c=0;
}

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

- (void)viewDidAppear {
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
   // NSLog(@"motionBegan");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{

    c+=1;
    count.text = [NSString stringWithFormat:@"%d回",c];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionCancelled");
}

@end
