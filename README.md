# UIImage-QRCode
 - 一个有关二维码的UIImage分类

###有以下几个功能
####根据需要转换的文本内容产生对应的二维码图片

```objc
+ (instancetype)imageWithmMessageString:(NSString *)messageString;
```

####修改一张图片的前景色和背景色 

```objc
- (instancetype)setForegroundColor:(UIColor *)foregroundColor backgroundColor:(UIColor *)backgroundColor;
```

####往二维码图片正中间添加一张图片 占比为0.2

```objc
- (instancetype)addCentreImage:(UIImage *)centerImage;
```

####得图片二维码内自带的内容

```objc
- (NSString *)messageString;
```
