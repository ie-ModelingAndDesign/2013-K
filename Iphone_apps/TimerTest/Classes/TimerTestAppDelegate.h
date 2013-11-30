//
//  TimerTestAppDelegate.h
//  TimerTest
//
//  Created by picaudiopro on 8/2/11.
//  Copyright 2011 picaudiopro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TimerTestViewController;

@interface TimerTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TimerTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TimerTestViewController *viewController;

@end

