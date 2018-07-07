//
//  UIView+isaScreenshot.m
//  JMCategory
//
//  Created by xserver on 2016/10/26.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIView+isaScreenshot.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (isaScreenshot)

- (UIImage *)isaScreenshot {

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

@end
