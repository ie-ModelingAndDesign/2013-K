//
//  ViewController.h
//  Timer-Count
//
//  Created by Takumi ITO on 2013/12/05.
//  Copyright (c) 2013年 Takumi ITO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSTimer *timeTicker;
    IBOutlet UILabel *count;
    IBOutlet UIButton *btn;
    IBOutlet UILabel *time;
}
@property (weak, nonatomic) IBOutlet UILabel *count;

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)Start:(id)sender;
- (void)showActivity;

@end
