//
//  XUIScrollView.h
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 1、没有循环滚动
 2、subview 由子视图提供
 3、delegate 提供宽度
 */

@class XUIScrollView;

@protocol XUIScrollViewDelegate <NSObject>

- (NSInteger)numberOfXUIScrollView:(XUIScrollView *)scroll;
- (UIView *)XUIScrollView:(XUIScrollView *)scroll contentViewAtIndex:(NSUInteger)index;
- (CGSize)XUIScrollViewContentSize;
@end


@interface XUIScrollView : UIView

@property (assign, nonatomic) CGPoint spacing;
@property (weak,   nonatomic) id delegate;

+ (instancetype)makeObjWithFrame:(CGRect)frame;
- (void)reloadData;

@end