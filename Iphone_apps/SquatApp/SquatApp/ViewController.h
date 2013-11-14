//
//  ViewController.h
//  Squat
//
//  Created by 敦史 掛川 on 12/02/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController {
    BOOL isCounting;
    BOOL isSitting;
    BOOL isDecelerationStarted;
    int count;
    CMMotionManager *motionManager;
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;
- (IBAction)buttonPressed:(id)sender;

@end
