//
//  ViewController.m
//  stopWatchView
//
//  Created by たかひろ　あふそ on 2013/11/30.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize time;

-(IBAction) strart:(id) sender{
    timeTicker = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(showActivity) userInfo:nil repeats:YES];
}

/*-(IBAction) stop:(id) sender{
    [timeTicker invalidate];
}*/

-(IBAction) clear:(id) sender{
    time.text = @"5.00";
}

-(void)showActivity{
    float currentTime = [time.text floatValue];
    
    float displayTime = currentTime - 0.01;
    
    time.text = [NSString stringWithFormat:@"%.2f", displayTime];//%.2fは少数点第二位
    //↑は標準入力
    
    float endTime = [time.text floatValue];
    
    if(endTime == 0.00){
        
        [timeTicker invalidate];
        
        time.text = @"0.00";
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


- (void)dealloc {
    [super dealloc];
}

@end