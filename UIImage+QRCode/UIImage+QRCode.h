//
//  UIImage+QRCode.h
//  UIImage+QRCode
//
//  Created by Danyow.Ed on 2016/3/28.
//  Copyright © 2016年 Danyow.Ed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCode)

/** 根据需要转换的文本内容产生二维码图片 */
+ (instancetype)imageWithmMessageString:(NSString *)messageString;

/** 修改一张图片的前景色和背景色 */
- (instancetype)setForegroundColor:(UIColor *)foregroundColor backgroundColor:(UIColor *)backgroundColor;

/** 往二维码图片正中间添加一张图片 占比为0.2 */
- (instancetype)addCentreImage:(UIImage *)centerImage;

/** 返回图片二维码内自带的内容 */
- (NSString *)messageString;


@end
