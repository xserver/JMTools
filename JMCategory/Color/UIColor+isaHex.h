//
//  UIColor+isaHex.h
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (isaHex)

+ (UIColor *)isaHexColor:(UInt32)hex;

/**
 *  16进制数字转为 UIColor
 *
 *  @param hex   16 进制数据, 0x123456
 *  @param alpha [0, 1]
 *
 *  @return UIColor
 */
+ (UIColor *)isaHexColor:(UInt32)hex alpha:(CGFloat)alpha;


/**
 *  16进制字符串转为 UIColor
 *
 *  @param string @"123456" or @"0x123456"
 *
 *  @return UIColor or nil
 */
+ (UIColor *)isaHexColorWithString:(NSString *)string;


@end
