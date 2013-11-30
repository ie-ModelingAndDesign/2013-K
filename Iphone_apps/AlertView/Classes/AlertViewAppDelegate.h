//
//  AlertViewAppDelegate.h
//  AlertView
//
//  Created by picaudiopro on 9/13/11.
//  Copyright 2011 picaudiopro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlertViewViewController;

@interface AlertViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AlertViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AlertViewViewController *viewController;

@end

