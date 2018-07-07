//
//  UIColor+isaRandom.m
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIColor+isaRandom.h"

@implementation UIColor (isaRandom)

+ (UIColor *)isaRandom {
    
    CGFloat red   = arc4random() % 256 / 256.0;
    CGFloat blue  = arc4random() % 256 / 256.0;
    CGFloat green = arc4random() % 256 / 256.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}


CGFloat tingValue(CGFloat v) {
    return (v - 102) / 0.6;
    
    //    如果取 0-1.0（UIColor 中 RGB 的取值），对应公式：
    //    y = (x - 0.4) / 0.6
}

@end
