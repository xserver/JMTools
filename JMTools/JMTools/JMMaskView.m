//
//  JMMaskView.m
//  JMTools
//
//  Created by xserver on 16/5/7.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMMaskView.h"

@implementation JMMaskView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:[[UIScreen mainScreen] bounds]]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEmpty)]];
    }
    return self;
}

- (void)clickEmpty {
    [self dismiss];
}

- (void)showInWindow {
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    if (self.appear) {
        self.appear(self);
    }
}

- (void)dismiss {
    self.appear = nil;
    
    [self removeFromSuperview];
}

@end
