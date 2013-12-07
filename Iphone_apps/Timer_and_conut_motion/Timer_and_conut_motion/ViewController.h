//
//  ViewController.h
//  Timer_and_conut_motion
//
//  Created by たかひろ　あふそ on 2013/12/05.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController {
    
    IBOutlet UILabel *count;
    IBOutlet UILabel *time;
    
    NSTimer *timeTicker;
}

@property(nonatomic, retain) UILabel *time;
@property(nonatomic, retain) UILabel *count;

-(IBAction) strart:(id) sender;
//-(IBAction) stop:(id) sender;
-(IBAction) clear:(id) sender;
-(IBAction) reset:(id) sender;

-(void)showActivity;

@end
