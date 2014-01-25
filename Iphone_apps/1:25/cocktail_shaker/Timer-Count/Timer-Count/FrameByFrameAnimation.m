//
//  FBFAnimation.m
//  FBFAnimation
//
//  Created by 廣川政樹 on 2013/04/03.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "FrameByFrameAnimation.h"

@implementation FrameByFrameAnimation

@synthesize animationImageView = _animationImageView;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
  }
  return self;
}

//アニメーション設定
- (void)setAnimating:(int)animationImageNum :(NSString *)animationImageSuffix :(float)animationDuration :(int)animationRepeatCount :(NSInteger)animationImageX :(NSInteger)animationImageY :(NSInteger)animationImageWidth :(NSInteger)animationImageHeight
{
  //UIImageView初期化
  _animationImageView = [[UIImageView alloc]
                         initWithFrame:CGRectMake(animationImageX,
                                                  animationImageY,
                                                  animationImageWidth,
                                                  animationImageHeight)];
  //アニメーションフレームを配列に入れる
  NSMutableArray *animationImageArray = [NSMutableArray array];
  for (int i = 1; i <= animationImageNum; i++) {
    [animationImageArray addObject:[NSString stringWithFormat:@"%@%@", animationImageSuffix, [NSString stringWithFormat:@"%d", i]]];
  }
  _animationImageView.animationImages = [self animationImages:animationImageArray];
  //アニメーションの秒数を設定
  _animationImageView.animationDuration = animationDuration;
  //アニメーションのリピート回数を設定
  _animationImageView.animationRepeatCount = animationRepeatCount;
  //アニメーション開始
  [_animationImageView startAnimating];
  //アニメーション終了時のメソッド定義
  [self performSelector:@selector(animationDidFinish:) withObject:nil
             afterDelay:_animationImageView.animationDuration];
}

//アニメーション終了時のメソッド
- (void)animationDidFinish:(SEL)selector
{
  NSLog(@"Animation is complete");
}

//画像ファイル名を配列で取得する
- (NSArray *)animationImages:(NSMutableArray *)animationImageNameList
{
  //画像の配列を作成
  NSMutableArray *imageArray = [NSMutableArray array];
  for (int i = 0; i < animationImageNameList.count; i++) {
    NSString *imageTitle = [animationImageNameList objectAtIndex:i];
    //画像の配列に画像ファイルを追加
    [imageArray addObject:[FrameByFrameAnimation getUIImageFromResources:imageTitle ext:@"png"]];
  }
  return (imageArray);
}

//画像ファイルを取得
+ (UIImage *)getUIImageFromResources:(NSString*)fileName ext:(NSString*)ext
{
  NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:ext];
  UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
  return img;
}

@end
