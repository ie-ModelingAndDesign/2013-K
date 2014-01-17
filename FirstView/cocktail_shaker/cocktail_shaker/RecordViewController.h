//
//  RecordViewController.h
//  cocktail_shaker
//
//  Created by Takumi ITO on 2014/01/17.
//  Copyright (c) 2014年 Takumi ITO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordViewController : UIViewController

@property int score;
@property int button_n;

@property (weak, nonatomic) IBOutlet UILabel *Record;
@property (weak, nonatomic) IBOutlet UILabel *Total;
@end
