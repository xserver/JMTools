//
//  XMathObj.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XMathObj : NSObject

//  
+ (int)randomInteger:(int)min to:(int)max;

//-- 浮点数比较
+ (BOOL)floatA:(float)f1 equalB:(float)f2;

+ (NSString *)niceNumber:(NSInteger)number;

+ (CGPoint)view:(UIView *)view convertToGL:(CGPoint)pt;
+ (CGPoint)view:(UIView *)view convertToNS:(CGPoint)pt;
@end
