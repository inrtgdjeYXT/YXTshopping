//
//  YXTGoodsModel.h
//  text
//
//  Created by 汤天明 on 16/5/31.
//  Copyright © 2016年 tm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXTGoodsModel : NSObject
/**商品名称*/
@property (nonatomic,copy) NSString *goodName;
/**商品图片地址*/
@property (nonatomic,copy) NSString *goodIcon;
/**商品描述*/
@property (nonatomic,copy) NSString *goodDesc;
/**商品价格*/
@property (nonatomic,assign) CGFloat goodPrice;



@end
