//
//  UIImage+ZMImage.m
//  03-彩票框架
//
//  Created by 陈正茂 on 16/6/18.
//  Copyright © 2016年 陈正茂. All rights reserved.
//

#import "UIImage+ZMImage.h"

@implementation UIImage (ZMImage)

//快速的返回一个最原始的图片
+ (instancetype)imageWithRenderingImage:(NSString *)imgName{
    UIImage *image = [UIImage imageNamed:imgName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)imageWithstretchableImageName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
