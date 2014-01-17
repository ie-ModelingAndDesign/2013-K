//
//  FrameByFrameAnimation.h
//  FrameByFrameAnimation
//
//  Created by 廣川政樹 on 2013/04/05.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrameByFrameAnimation : UIImageView

@property (nonatomic, retain) UIImageView *animationImageView;

- (void)setAnimating:(int)animationImageNum :(NSString *)animationImageSuffix :(float)animationDuration :(int)animationRepeatCount :(NSInteger)animationImageX :(NSInteger)animationImageY :(NSInteger)animationImageWidth :(NSInteger)animationImageHeight;
- (NSArray *)animationImages:(NSMutableArray *)animationImageNameList;
+ (UIImage *)getUIImageFromResources:(NSString*)fileName ext:(NSString*)ext;

@end
