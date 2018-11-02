////
////  XLine.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
////  http://blog.csdn.net/yang3wei/article/details/7521298
//#import "XLine.h"
//
//@interface XLine ()
//@property (assign, nonatomic) CGFloat k;
//@property (assign, nonatomic) CGFloat c;
//@property (assign, nonatomic) BOOL isExists;
//@end
//
//@implementation XLine
//- (NSString *)description {
//    return [NSString stringWithFormat:@"Y = %f * X + %f", _k, _c];
//}
//- (BOOL)isExists {
//    return _isExists;
//}
//- (CGFloat)k {
//    return _k;
//}
//- (CGFloat)c {
//    return _c;
//}
//
//- (CGFloat)xWithY:(CGFloat)y {
//    return (y - _c) / _k;
//}
//- (CGFloat)yWithX:(CGFloat)x {
//    return _k * x + _c;
//}
//
///** 已知两点，求过该两点的直线表达式~ */
//+ (XLine *)line:(CGPoint)p1 anotherPoint:(CGPoint)p2 {
//    
//    //  斜率为0的线
//    if((p1.x - p2.x) == 0) {
//        return nil;
//    }
//    
//    XLine *line = [[XLine alloc] init];
//    line.isExists = YES;
//    line.k = (p1.y - p2.y) / (p1.x - p2.x);
//    line.c = p1.y - line.k * p1.x;
//    
//    return line;
//}
//
///** 已知一点和直线斜率，求该直线的表达式~ */
//+ (XLine *)Line:(CGPoint)point k:(CGFloat)k {
//
//    XLine *line = [[XLine alloc] init];
//    line.isExists = true;
//    line.k = k;
//    line.c = point.y - k * point.x;
//    return line;
//}
//
//
//+ (CGFloat)distanceBetween2point:(CGPoint)p0 anotherPoint:(CGPoint)p1 {
//    return sqrt(pow(p0.y - p1.y, 2) + pow(p0.x - p1.x, 2));
//}
//
//@end
