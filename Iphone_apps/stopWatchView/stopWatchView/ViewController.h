//
//  ViewController.h
//  stopWatchView
//
//  Created by たかひろ　あふそ on 2013/11/30.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

IBOutlet UILabel *time;

NSTimer *timeTicker;
}

@property(nonatomic, retain) UILabel *time;

-(IBAction) strart:(id) sender;
//-(IBAction) stop:(id) sender;
-(IBAction) clear:(id) sender;

-(void)showActivity;

@end
