//
//  JMCountdownButton.h
//  JMTools
//
//  Created by xserver on 15/7/2.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMCountdownButton : UIButton

@property (nonatomic, copy) void(^callback)(JMCountdownButton *button);

@property (nonatomic, strong) NSString *startTitle;     //  default = @"获取"
@property (nonatomic, strong) NSString *stopTitle;      //  default = @""
@property (nonatomic, strong) NSString *format;         //  default = @"剩余 %d 秒"
@property (nonatomic, assign) NSInteger countdownSecond;//  default = 6

- (instancetype)initWithFrame:(CGRect)frame;

- (void)start;
- (void)stop;

@end
