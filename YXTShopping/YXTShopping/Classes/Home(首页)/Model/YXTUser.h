//
//  YXTUser.h
//  YiXuanTongShop
//
//  Created by 汤天明 on 16/6/28.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXTUser : NSObject<NSCoding>
/**用户ID*/
@property (nonatomic,copy) NSString *userID;
/**用户密码*/
@property (nonatomic,copy) NSString *password;
/** 用户名字 */
@property (nonatomic,copy) NSString *userName;
/**用户电话*/
@property (nonatomic,copy) NSString *contantPhone;
/**用户邮箱*/
@property (nonatomic,copy) NSString *email;
/**用户地址*/
@property (nonatomic,copy) NSString *address;
-(instancetype)initWithAttributes:(NSDictionary *)attributes;

-(NSDictionary *)dictFrom:(YXTUser *)user;

@end
