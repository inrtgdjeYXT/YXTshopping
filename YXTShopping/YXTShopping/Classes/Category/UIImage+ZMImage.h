//
//  UIImage+ZMImage.h
//  03-彩票框架
//
//  Created by 陈正茂 on 16/6/18.
//  Copyright © 2016年 陈正茂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZMImage)
//快速返回一个原始样式的图片,不被渲染
+ (instancetype)imageWithRenderingImage:(NSString *)imgName;

//快速拉伸图片
+ (instancetype)imageWithstretchableImageName:(NSString *)imageName;
@end
