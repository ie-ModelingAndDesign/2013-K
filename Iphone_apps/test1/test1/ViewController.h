//
//  ViewController.h
//  test1
//
//  Created by たかひろ　あふそ on 2013/12/15.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//
#import <AudioToolbox/AudioServices.h>
#import <UIKit/UIKit.h>
@interface ViewController : UIViewController <UIAccelerometerDelegate> {
	UIAccelerometer *accelerometer;
}
@property (nonatomic, retain) UIAccelerometer *accelerometer;
@end
