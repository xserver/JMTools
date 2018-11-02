//
//  XUIProgressButton.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XUIButtonActivity.h"

@interface XUIButtonActivity ()

@property (strong, nonatomic) UIActivityIndicatorView *act;
@property (strong, nonatomic) UIColor *color;
@property (assign, nonatomic) BOOL activity;
@property (assign, nonatomic) CGPoint mycenter;
@end


@implementation XUIButtonActivity

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _mycenter = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:self.act];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _mycenter = CGPointMake(frame.size.width/2, frame.size.height/2);
    self.act.center = _mycenter;
}

#pragma mark - act
- (UIActivityIndicatorView *)act {
    if (_act == nil) {
        _act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _act.center = _mycenter;
    }
    return _act;
}
- (void)setIndicatorColor:(UIColor *)color {
    _color = color;
    [self.act setColor:_color];
}

#pragma mark - action
- (void)changeActivityStatus {
    BOOL activity = !_activity;
    [self setActivity:activity animated:YES];
}

- (void)setActivity:(BOOL)activity animated:(BOOL)animated {
    
    _activity = activity;
    
    if (activity) {
        [UIView animateWithDuration:0.15 animations:^{
            [self activityAction];
        }];
    }else{
        [self activityAction];
    }
}

- (void)activityAction {
//    self.btn.alpha = _activity ? 0 : 1;
    self.act.alpha = _activity ? 1 : 0;
    _activity ? [_act startAnimating] : [_act stopAnimating];
}

- (BOOL)isAnimating {
    return [self.act isAnimating];
}
@end
