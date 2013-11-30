//
//  AlertViewViewController.h
//  AlertView
//
//  Created by picaudiopro on 9/13/11.
//  Copyright 2011 picaudiopro. All rights reserved.
//

#import <UIKit/UIKit.h>


//
//  AlertViewViewController
//    UIAlertViewDelegate Protocolを指定する。<UIAlertViewDelegate>
//    作成したAlertViewからalertViewメソッドをコールしてもらうため。
//
@interface AlertViewViewController : UIViewController <UIAlertViewDelegate> {

	IBOutlet UILabel *alertLabel;
	IBOutlet UILabel *selectLabel;
	
}

- (IBAction)Open1SelectionPress:(id)sender;
- (IBAction)Open2SelectionPress:(id)sender;
- (IBAction)Open3SelectionPress:(id)sender;

@end

