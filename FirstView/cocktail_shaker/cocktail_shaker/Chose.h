//
//  Chose.h
//  cocktail_shaker
//
//  Created by Takumi ITO on 2014/01/17.
//  Copyright (c) 2014年 Takumi ITO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface Chose : UIViewController{
    
    CFURLRef soundURL;
    SystemSoundID soundID;
    
    
    
    NSTimer *timeTicker;
}
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)toRecord:(id)sender;
@property int button_no;
- (void)showActivity;



@property(readwrite) CFURLRef soundURL;
@property(readonly) SystemSoundID soundID;

@end
