//
//  YXTHomeHeadView.h
//  YiXuanTongShop
//
//  Created by 汤天明 on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXTBanner;
@class YXTHomeHeadView;

@protocol YXThomeHeadViewDelegate <NSObject>

-(void)selectedButtonWith:(NSInteger)index;

@end

@interface YXTHomeHeadView : UIView

@property(nonatomic,weak) id<YXThomeHeadViewDelegate>delegate;

+(instancetype)HomeHeadView;

-(void)setUIWith:(NSArray<YXTBanner *> *)models;

- (IBAction)selectedButtonIn:(UIButton *)sender;

@end
