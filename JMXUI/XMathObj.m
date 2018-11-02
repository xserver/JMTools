//
//  XMathObj.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XMathObj.h"

@implementation XMathObj

+ (int)randomInteger:(int)min to:(int)max {
    
    return (int)(min + (arc4random() % (max - min + 1)));
}

+ (BOOL)floatA:(float)f1 equalB:(float)f2 {
    
    const float EPSINON = 0.00001;
    if ((f1 > 0.0f && f2 > 0.0f) || (f1 < 0.0f && f2 < 0.0f))
    {
        float x = fabsf(f1) - fabsf(f2);
        if (x >= -EPSINON && x <= EPSINON) {
            return YES;
        }
    }
    return NO;
}

+ (NSString *)niceNumber:(NSInteger)number {
    
//    if (number < 999) {
//        return [NSString int2str:number];
//    }
//    //  1.2k
//    if (number < 9999) {
//        float value = number / 1000.0;
//        NSString *txt = [NSString stringWithFormat:@"%1.1fk", value];
//        return txt;
//    }
//    //  99k = 99999
//    if (number < 99999) {
//        int value = number / 1000;
//        NSString *txt = [NSString stringWithFormat:@"%dk", value];
//        return txt;
//    }
    //  3.1w
    //    if (count < 99999) {
    //        float value = count / 10000.0;
    //        NSString *txt = [NSString stringWithFormat:@"%1.1fw", value];
    //        NSLog(@"%@", txt);
    //        return txt;
    //    }
    return @"99k";
}

+ (CGPoint)view:(UIView *)view convertToGL:(CGPoint)pt {
    NSLog(@"%f %f", view.frame.size.height, pt.y);
    return CGPointMake(pt.x, view.frame.size.height - pt.y);
}

+ (CGPoint)view:(UIView *)view convertToNS:(CGPoint)pt {
    
    return CGPointMake(pt.x, view.frame.size.height - pt.y);
}

@end
