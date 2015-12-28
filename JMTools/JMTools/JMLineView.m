//
//  JMLineView.m
//  line
//
//  Created by xserver on 15/2/21.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMLineView.h"

@implementation JMLineView
static UIColor *defaultColor = nil;

+ (void)initialize {
    [JMLineView setDefaultLineColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]];
}

+ (void)setDefaultLineColor:(UIColor *)color {
    defaultColor = color;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        self.lineColor = defaultColor;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        self.lineColor = defaultColor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetLineWidth(context, 0.5);
    
    if (rect.size.width  < 1.2) {
        //  竖线
        CGContextMoveToPoint(   context, CGRectGetMinX(rect), CGRectGetMinY(rect));
        CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    } else {
        CGContextMoveToPoint(   context, CGRectGetMinX(rect), CGRectGetMinY(rect));
        CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    }

    CGContextStrokePath(context);
}

@end
