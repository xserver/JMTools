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
    [JMLineView setDefaultLineColor:[UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:0.36]];
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

    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextSetShouldAntialias(context, NO);
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    
    if (rect.size.width  < 1.2) {
        //  竖线
        CGContextMoveToPoint(   context, CGRectGetMinX(rect), CGRectGetMinY(rect));
        CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    } else {
        
        CGFloat y = (self.frame.origin.y < 0.5) ? CGRectGetMinY(rect) : CGRectGetMaxY(rect);
        CGContextMoveToPoint(   context, CGRectGetMinX(rect), y);
        CGContextAddLineToPoint(context, CGRectGetMaxX(rect), y);
    }
    
    CGContextStrokePath(context);
}

@end
