//
//  XFullViewOper.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XFullViewOper : NSObject

+ (instancetype)makeObj;

- (void)setScrollView:(UIScrollView *)scroll toolbar:(UIView *)toolbar;

@property (assign) BOOL isFull;
@end
