//
//  ViewController.h
//  Timer-Count
//
//  Created by Takumi ITO on 2013/12/05.
//  Copyright (c) 2013年 Takumi ITO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <ImageIO/ImageIO.h>
//#import <MobileCoreServices/MobileCoreServices.h>



@interface ViewController : UIViewController{
    
    CFURLRef soundURL;
    SystemSoundID soundID;
    
    UIImage* image;
 
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
