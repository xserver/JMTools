//
//  UIView+isaCategory.m
//  JMCategory
//
//  Created by xserver on 2016/10/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIView+isaCategory.h"

@implementation UIView (isaCategory)


- (void)isaMakeCornerRound {
    CGFloat radius = self.frame.size.width/2;
    [self isaMakeCornerRoundWithRadius:radius];
}

- (void)isaMakeCornerRoundWithRadius:(CGFloat)radius {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    shape.frame = self.bounds;
    shape.path  = path.CGPath;
    self.layer.mask = shape;
}


@end
