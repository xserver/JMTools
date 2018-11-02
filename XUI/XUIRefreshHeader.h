/*
//
//  XUIRefreshHeader.h
//  XUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2012年 xserver. All rights reserved.
//

//
//  EGORefreshTableHeaderView.h
//
//  Created by Devin Doty on 10/14/09October14.
//  Copyright 2009 enormego. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAJMXUIES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

*/
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
    XUIPullRefreshNull,
	XUIPullRefreshNormal,
	XUIPullRefreshPulling,
	XUIPullRefreshLoading,
    XUIPullRefreshFailed,
    XUIPullRefreshFinished,
} XUIPullRefreshState;


@class XUIRefreshHeader;
@protocol XUIRefreshHeaderDelegate <NSObject>

@required
- (void)pullHeaderEvent:(XUIRefreshHeader *)view;

@optional
@end


@interface XUIRefreshHeader : UIView

@property (nonatomic, weak) id<XUIRefreshHeaderDelegate> delegate;

+ (instancetype)makeWithTableView:(UITableView *)tableView;

- (void)close;

- (void)closeAfterFinished;
- (void)closeAfterFailed;
@end





////  监听scroll view，修改UI
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
//
////  下拉松手时，减速时执行，触发事件
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView;