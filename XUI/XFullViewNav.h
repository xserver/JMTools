//
//  XFullViewNav.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XFullViewNav : NSObject

@property (assign, nonatomic) CGRect frame;
@property (assign, nonatomic) CGRect frameFull;

+ (instancetype)makeObj;

- (void)setScrollView:(UIScrollView *)scroll fullView:(UIView *)fullView;

- (void)setFull:(BOOL)on;

@end
