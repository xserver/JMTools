//
//  JMCountdownButton.m
//  JMTools
//
//  Created by xserver on 14/7/2.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMCountdownButton.h"

@implementation JMCountdownButton
{
    NSTimeInterval _total;
    NSTimeInterval _second;
    NSTimer *_timer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (instancetype)init {
    exit(0);
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    self.countdownSecond = 6;
    self.stopTitle = @"请按我";
    self.startTitle = @"获取";
    
    [self setTitle:self.startTitle forState:0];
}

- (void)start {
    [self startWithSecond:self.countdownSecond];
    
    if (self.callback) {
        self.callback(self);
    }
}

- (void)startWithSecond:(NSInteger)second {
    if (second <= 0) {
        return;
    }
    if (_timer) {
        [_timer invalidate];
    }
    
    self.enabled = NO;
    _second = second;
    _total = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTitle) userInfo:nil repeats:YES];
    [_timer fire];

}

- (void)stop {
    if (_timer) {
        [_timer invalidate];
        self.enabled = YES;
        [self setTitle:self.stopTitle forState:0];
    }
}

- (void)updateTitle {
    
    _total++;
    if (_total > _second) {
        [self stop];
        return;
    }
    
    NSString *title;
    if (_format) {
        title = [NSString stringWithFormat:_format, _second - _total];
    }else{
        title = [NSString stringWithFormat:@"剩余 %.0f 秒", _second - _total];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setTitle:title forState:0];
    });
}
@end
