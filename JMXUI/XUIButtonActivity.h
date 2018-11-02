//
//  XUIProgressButton.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

//  按钮+菊花

@interface XUIButtonActivity : UIView



+ (instancetype)makeWithButton:(UIButton *)btn;


- (void)setIndicatorColor:(UIColor *)color;

- (void)setButton:(UIButton *)btn;
- (void)setSelected:(BOOL)selected;

- (void)setActivity:(BOOL)activity animated:(BOOL)animated;
- (BOOL)isAnimating;
@end
