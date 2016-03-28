//
//  ViewController.m
//  UIImage+QRCodeExample
//
//  Created by Danyow.Ed on 2016/3/28.
//  Copyright © 2016年 Danyow.Ed. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+QRCode.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *QRCodeImageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.QRCodeImageView.image = [UIImage imageWithmMessageString:@"嘿嘿嘿"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.QRCodeImageView.image = [self.QRCodeImageView.image setForegroundColor:[UIColor redColor] backgroundColor:[UIColor whiteColor]];
    
    self.QRCodeImageView.image = [self.QRCodeImageView.image addCentreImage:[UIImage imageNamed:@"m_197_100"]];
    
    NSLog(@"%@", [self.QRCodeImageView.image messageString]);
    
}

@end
