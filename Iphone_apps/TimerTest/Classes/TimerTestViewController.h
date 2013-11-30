//
//  TimerTestViewController.h
//  TimerTest
//
//  Created by picaudiopro on 8/2/11.
//  Copyright 2011 picaudiopro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerTestViewController : UIViewController {

	IBOutlet UILabel *timerCountLabel;

	NSTimer *repeatTimer;
	NSTimer *unscheduledTimer;
	NSUInteger timerCount;
}

@property (assign) NSTimer *repeatTimer;
@property (retain) NSTimer *unscheduledTimer;

- (IBAction)startOneTimeTimer:(id)sender;
- (void)eventOneTimeTimer:(NSTimer*)theTimer;

- (IBAction)startRepeatTimer:(id)sender;
- (IBAction)stopRepeatTimer:(id)sender;
- (void)eventRepeatTimer:(NSTimer*)theTimer;

- (IBAction)createUnscheduledTimer:(id)sender;
- (IBAction)startUnscheduledTimer:(id)sender;
- (IBAction)stopUnscheduledTimer:(id)sender;
- (void)eventUnscheduledTimer:(NSDate *)date;

- (IBAction)startFireDateTimer:(id)sender;
- (void)eventFireDateTimer:(NSTimer*)theTimer;

- (NSDictionary *)userInfo;

@end

