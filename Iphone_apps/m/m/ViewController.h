//
//  ViewController.h
//  m
//
//  Created by たかひろ　あふそ on 2013/12/05.
//  Copyright (c) 2013年 たかひろ　あふそ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
IBOutlet UILabel *count;
}

@property(nonatomic, retain) UILabel *count;
//-(IBAction) stop:(id) sender;
-(IBAction) clear:(id) sender;

@end
