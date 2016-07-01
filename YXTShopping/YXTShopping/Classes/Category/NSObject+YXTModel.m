//
//  NSObject+YXTModel.m
//  YiXuanTongShop
//
//  Created by czm on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "NSObject+YXTModel.h"

#import <objc/runtime.h>

@implementation NSObject (YXTModel)

//快速的进行字典转模型
+ (instancetype)objWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict{
    id obj = [[self alloc] init];
    //1.遍历模型中的属性名
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for(int i = 0; i < count; i++){
        Ivar ivar = ivars[i];
        //获取带下划线的属性名
        NSString *ivarName = @(ivar_getName(ivar));
        //去掉下划线
        ivarName = [ivarName substringFromIndex:1];
        
        //2.给模型中的属性赋值
        id value = dict[ivarName];
        //由外部通知内部,模型中的属性名对应字典里面的那个key
        if(value == nil){
            if(mapDict){
                NSString *keyName = mapDict[ivarName];
                value = dict[keyName];
            }
        }
        [obj setValue:value forKey:ivarName];
        
        //NSLog(@"*******%@", ivarName);
        
    }
    
    return obj;
}


@end