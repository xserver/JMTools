//
//  XFullViewMan.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XFullViewMan : NSObject

@property (assign, nonatomic) CGRect frame;
@property (assign, nonatomic) CGRect frameFull;

+ (instancetype)makeObj;

- (void)setScrollView:(UIScrollView *)scroll
             fullView:(UIView *)fullView
        navigationBar:(UIView *)nav
              toolbar:(UIView *)toolbar;


- (void)setFull:(BOOL)on;

@end
