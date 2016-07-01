//
//  ZMUserManager.h
//  YiXuanTongShop
//
//  Created by czm on 16/6/30.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface ZMUserManager : NSObject

//用户登录
- (void)loginWith:(void(^)(BOOL isSuccess))isSuccess andParameters:(NSDictionary *)dict;

//用户注册
- (void)registWith:(void(^)(BOOL isSuccess))isSuccess andParameters:(NSDictionary *)dict;


interfaceSingleton(ZMUserManager);

@end
