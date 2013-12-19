//
//  ViewController.m
//  test1
//
//  Created by たかひろ　あふそ on 2013/12/15.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//

//#import "RecordViewController.h"
#import "ViewController.h"


@implementation ViewController
@synthesize accelerometer;
//@synthesize soundID;
- (void)viewDidLoad {
    [super viewDidLoad];
    
	//シェイクジェスチャー検知準備
	self.accelerometer = [UIAccelerometer sharedAccelerometer];
	self.accelerometer.updateInterval = 0.1;
	self.accelerometer.delegate = self;
    
	//音の再生準備
	NSString *path = [[NSBundle mainBundle] pathForResource:@"4_111" ofType:@"wav"];
	NSURL *url = [NSURL fileURLWithPath:path];
	//AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	const float violence = 1.5;
	static BOOL beenhere;
	BOOL shake = FALSE;
    
	if (beenhere) return;
	beenhere = TRUE;
    
	if (acceleration.x > violence || acceleration.x < -1*violence)
	{
		shake = TRUE;
	}
	if (acceleration.y > violence || acceleration.x < -1*violence)
	{
		shake = TRUE;
	}
	if (acceleration.z >violence || acceleration.z < -1*violence)
	{
		shake = TRUE;
	}
	if (shake)
	{
		//self.ここに処理を入れる;
	}
	beenhere = FALSE;
}
@end