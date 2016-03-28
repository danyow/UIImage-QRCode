//
//  UIImage+QRCode.m
//  UIImage+QRCode
//
//  Created by Danyow.Ed on 2016/3/28.
//  Copyright © 2016年 Danyow.Ed. All rights reserved.
//

#import "UIImage+QRCode.h"

@implementation UIImage (QRCode)

- (CIImage *)changeToCIImage
{
    CIImage *ciImage = [self CIImage];
    if (!ciImage) {
        ciImage = [CIImage imageWithCGImage:[self CGImage]];
    }
    return ciImage;
}

/** 根据需要转换的文本内容产生二维码图片 */
+ (instancetype)imageWithmMessageString:(NSString *)messageString
{
    
    CIFilter *QRFilter  = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    NSData *contentData = [messageString dataUsingEncoding:NSUTF8StringEncoding];
    
    [QRFilter setValue:contentData forKey:@"inputMessage"];
    
    [QRFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    // 设置默认值
    [QRFilter setDefaults];
    
    CIImage *QRCiImage = QRFilter.outputImage;
    
    // 放大二维码图片
    QRCiImage = [QRCiImage imageByApplyingTransform:CGAffineTransformMakeScale(10, 10)];
    
    return [UIImage imageWithCIImage:QRCiImage];
}

/** 修改一张图片的前景色和背景色 */
- (instancetype)setForegroundColor:(UIColor *)foregroundColor backgroundColor:(UIColor *)backgroundColor
{
    CIFilter *falseColorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    
    // 拿到原本的messageString值对应的二维码图片 不然会失真
    UIImage *image   = [UIImage imageWithmMessageString:[self messageString]];

    CIImage *ciImage = [image changeToCIImage];
    
    [falseColorFilter setValue:ciImage forKey:@"inputImage"];
    
    if (foregroundColor) {
        [falseColorFilter setValue:[CIColor colorWithCGColor:[foregroundColor CGColor]] forKey:@"inputColor0"];
    }
    if (backgroundColor) {
        [falseColorFilter setValue:[CIColor colorWithCGColor:[backgroundColor CGColor]] forKey:@"inputColor1"];
    }
    
    ciImage = falseColorFilter.outputImage;
    
    return [UIImage imageWithCIImage:ciImage];
}

/** 往二维码图片正中间添加一张图片 占比为0.2 */
- (instancetype)addCentreImage:(UIImage *)centerImage
{
    UIGraphicsBeginImageContext(self.size);
    
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    [centerImage drawInRect:({
        CGFloat width  = self.size.width * 0.2;
        CGFloat height = self.size.height * 0.2;
        CGFloat x      = (self.size.width - width) * 0.5;
        CGFloat y      = (self.size.height - height) * 0.5;
        CGRectMake(x, y, width, height);
    })];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

/** 返回图片二维码内自带的内容 */
- (NSString *)messageString
{
    CIDetector *detector     = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:nil];

    CIImage *ciImage         = [self changeToCIImage];

    NSArray *features        = [detector featuresInImage:ciImage];

    CIQRCodeFeature *feature = [features lastObject];
    
    return feature.messageString;
}



@end
