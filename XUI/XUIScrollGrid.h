//
//  XUIScrollView.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 目标：
 1、滑动窗口，每次滚动一格(屏幕大小）
 2、无需循环滚动
// 3、可以设定 subContent 的大小、边距
 4、知道点击的是什么东西
 5、重用机制
*/

@class XUIScrollGrid;

@protocol XUIScrollGridDelegate <NSObject>

- (NSInteger)numberOfXUIScrollView:(XUIScrollGrid *)scroll;

- (id)dequeueReusableGrid;
- (UIView *)XUIScrollView:(XUIScrollGrid *)scroll contentViewAtIndex:(NSUInteger)index;

- (void)XUIScrollView:(XUIScrollGrid *)scroll displayingView:(UIView *)grid index:(NSUInteger)index;
- (void)XUIScrollView:(XUIScrollGrid *)scroll didSelectGridAtIndex:(NSUInteger)index;
@end


@interface XUIScrollGrid : UIView

@property (assign, nonatomic) CGFloat gridSpacing;
@property (assign, nonatomic) CGFloat gridWidth;
@property (assign, nonatomic) CGPoint scaleSide;

@property (strong, nonatomic) NSArray *views;// 3个

@property (weak,   nonatomic) id delegate;

+ (instancetype)makeObjWithFrame:(CGRect)frame;
- (void)reloadData;

@end

