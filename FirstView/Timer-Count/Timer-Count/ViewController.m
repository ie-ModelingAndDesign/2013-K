//
//  ViewController.m
//  Timer-Count
//
//  Created by Takumi ITO on 2013/12/05.
//  Copyright (c) 2013年 Takumi ITO. All rights reserved.
//

#import "ViewController.h"
#import "RecordViewController.h"


int c=0;
int Score=0;
@implementation ViewController
@synthesize time;
@synthesize btn;
@synthesize count;

@synthesize soundURL;
@synthesize soundID;


SystemSoundID soundTest;





- (IBAction)toRecord:(id)sender{
    if([time.text isEqual: @"5.00"]){
        //音を鳴らす準備
        /*
        NSString *testSound = [[NSBundle mainBundle] pathForResource:@"hit_sound" ofType:@"mp3"];
        NSURL *urlOfTestSound = [NSURL fileURLWithPath:testSound];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)urlOfTestSound, &soundTest);
        
        
        //これも音楽　シャカシャカ
        CFBundleRef mainBundle;
        mainBundle = CFBundleGetMainBundle ();
        soundURL  = CFBundleCopyResourceURL (mainBundle,CFSTR ("test"),CFSTR ("mp3"),NULL);
        AudioServicesCreateSystemSoundID (soundURL, &soundID);
        CFRelease (soundURL);
        */
        
        
        
 
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
        time.text = @"0.00";
        [timeTicker invalidate];
        Score = c;
        //[btn setEnabled:YES];
        btn.hidden = NO;
        [btn setTitle:@"End" forState:UIControlStateNormal];
        
        
        
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

- (void)viewDidLoad
{

    
    [super viewDidLoad];
    
    
    
    
    //これも音楽　シャカシャカ
    CFBundleRef mainBundle;
    mainBundle = CFBundleGetMainBundle ();
    soundURL  = CFBundleCopyResourceURL (mainBundle,CFSTR ("test"),CFSTR ("mp3"),NULL);
    AudioServicesCreateSystemSoundID (soundURL, &soundID);
    CFRelease (soundURL);

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

    //シャカシャカ再生
    AudioServicesPlaySystemSound (soundID);
    c++;
    
    
    count.text = [NSString stringWithFormat:@"%04d", c];
    //NSLog(@"%d",c);
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionCancelled");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"%d",c);
    RecordViewController *vc = [segue destinationViewController];
    vc.score = Score;
    //NSLog(@"%d",vc.score);
}

@end
