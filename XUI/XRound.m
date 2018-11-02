////
////  XRound.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XRound.h"
//#import "XLine.h"
//
//@interface XRound ()
//@property (assign, nonatomic) CGFloat radius;
//@property (assign, nonatomic) CGPoint center;
//@end
//
//@implementation XRound
//
//+ (XRound *)roundWithCenter:(CGPoint)center radius:(CGFloat)radius {
//    XRound *round = [[XRound alloc] init];
//    round.radius = radius;
//    round.center = center;
//    return round;
//}
////  line : y = kx + c;
////  round: (x-a)^2 + (y-b)^2 = r^2;
////         (x-a)^2 + (kx + c-b)^2 = r^2;
////  d = c - b;
////         (x-a)^2 + (kx + d)^2 = r^2;
//
////  round + line : x^2(1 + k^2) + x(2dk - 2a) + (a^2 + d^2 - r^2) = 0
////  and ax^2 + bx + c = 0
//- (NSArray *)intersectPointWithLine:(XLine *)line {
//    
//    CGFloat a = _center.x;
//    CGFloat b = _center.y;
//    CGFloat c = line.c;
//    CGFloat k = line.k;
//    CGFloat d = c - b;
//
////    NSLog(@"a=%f b=%f c=%f d=%f k=%f", a, b, c, d, k);
//
//    CGFloat aa = 1 + pow(k, 2);
//    CGFloat bb = 2*(d*k - a);
//    CGFloat cc = pow(a, 2) + pow(d, 2) - pow(_radius, 2);
//    
//    //  Δ = √(b^2 - 4ac);
//    CGFloat A = sqrt(pow(bb, 2) - 4*aa*cc);
////    NSLog(@"aa=%f bb=%f cc=%f A=%f", aa, bb, cc, A);
//
//    CGFloat x1 = (-bb + A) / (2*aa);
//    CGFloat x2 = (-bb - A) / (2*aa);
//
//    CGFloat y1 = [line yWithX:x1];
//    CGFloat y2 = [line yWithX:x2];
////    NSLog(@"%f %f %f %f", x1, y1, x2, y2);
//
//    return @[[NSValue valueWithCGPoint:CGPointMake(x1, y1)],
//             [NSValue valueWithCGPoint:CGPointMake(x2, y2)]];
//}
//
//@end
