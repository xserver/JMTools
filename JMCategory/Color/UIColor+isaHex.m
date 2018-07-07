//
//  UIColor+isaHex.m
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIColor+isaHex.h"

@implementation UIColor (isaHex)

+ (UIColor *)isaHexColor:(UInt32)hex {
    return [self isaHexColor:hex alpha:1.0];
}

+ (UIColor *)isaHexColor:(UInt32)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0
                           green:((hex & 0x00FF00) >> 8) / 255.0
                            blue:((hex & 0xFF) >> 0) / 255.0
                           alpha:alpha];
}

+ (UIColor *)isaHexColorWithString:(NSString *)string {
    
    if ( ! (string.length == 6 || string.length == 8)) {
        return nil;
    }
    
    if (string.length == 8) {
        string = [string substringFromIndex:2];
    }
    
    const char *numberChar = string.UTF8String;
    UInt32 hexNumber = strtoul(numberChar, 0, 16);
    
    return [self isaHexColor:hexNumber alpha:1.0];
}


@end
