//
//  ZMRegistViewController.h
//  YiXuanTongShop
//
//  Created by czm on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMRegistViewController : UIViewController

@property (nonatomic, copy) void(^userBlock)(NSString *name, NSString *password);

@end
