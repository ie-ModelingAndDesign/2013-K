//
//  ViewController.m
//  Timer-Count
//
//  Created by Takumi ITO on 2013/12/05.
//  Copyright (c) 2013年 Takumi ITO. All rights reserved.
//

#import "ViewController.h"

int c=0;
@implementation ViewController
@synthesize time;
@synthesize btn;
@synthesize count;

- (IBAction)Start:(id)sender {
    c = 0;
        count.text = @"0000";
    timeTicker = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(showActivity) userInfo:nil repeats:YES];
}

-(void)showActivity{
    //[btn setEnabled:NO];
    btn.hidden = YES;
    float currentTime = [time.text floatValue];
    
    float displayTime = currentTime - 0.01;
    
    time.text = [NSString stringWithFormat:@"%.2f", displayTime];//%.2fは少数点第二位
    //↑は標準入力
    float endTime = [self.time.text floatValue];
    
    if(endTime == 0.00){
        
        [timeTicker invalidate];
        time.text = @"5.00";
        count.text = @"0000";
        c=0;
        //[btn setEnabled:YES];
        btn.hidden = NO;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    NSLog(@"motionBegan");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionEnded");
    c++;
    count.text = [NSString stringWithFormat:@"%04d", c];
    //NSLog(@"%d",c);
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionCancelled");
}

@end
