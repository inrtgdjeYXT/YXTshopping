//
//  YXTUser.m
//  YiXuanTongShop
//
//  Created by 汤天明 on 16/6/28.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "YXTUser.h"



@implementation YXTUser

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.userID = [attributes valueForKeyPath:@"id"];
    self.userName = [attributes valueForKeyPath:@"username"];
    
    
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
       self.userName = [coder decodeObjectForKey:@"name"];
        self.userID = [coder decodeObjectForKey:@"ID"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.userID forKey:@"ID"];
    [coder encodeObject:self.userName forKey:@"name"];
}
@end
