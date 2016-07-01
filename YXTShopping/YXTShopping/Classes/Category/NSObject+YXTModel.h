//
//  NSObject+YXTModel.h
//  YiXuanTongShop
//
//  Created by czm on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YXTModel)

//快速的进行字典转模型
//@param mapDict:表示模型中的某个属性名和字典中的属性名对应列表
+ (instancetype)objWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
