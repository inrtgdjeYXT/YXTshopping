//
//  ErrorView.m
//  YiXuanTongShop
//
//  Created by czm on 16/6/30.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "ErrorView.h"

@implementation ErrorView

+ (void)showWithTitle:(NSString *)title{
    ErrorView *view = [[ErrorView alloc] initWithFrame:CGRectMake(0, 0, 160, 120)];
    
    [self dismiss];
    
    [YXTWindow addSubview:view];
    
    view.center = CGPointMake(YXTScreenW * 0.5, YXTScreenH * 0.5 - 100);
    
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    view.layer.cornerRadius = 5;
    
    UILabel *tipText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
    tipText.text = title;
    tipText.numberOfLines = 0;
    tipText.textColor = [UIColor whiteColor];
    tipText.font = [UIFont systemFontOfSize:14];
    tipText.textAlignment = NSTextAlignmentCenter;
    tipText.center = CGPointMake(80, 60);
    
    [view addSubview:tipText];
    
    [view performSelector:@selector(remove) withObject:nil afterDelay:1];
}

- (void)remove{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

+ (void)dismiss{
    [YXTWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[ErrorView class]]){
            [obj removeFromSuperview];
            *stop = YES;
        }
    }];
    
}

@end
