////
////  XUIViewController.h
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//#import "XUIRefreshHeader.h"
//#import "XUIRefreshFooter.h"
//#import "MBProgressHUD.h"
//#import "XFullViewNav.h"
//
////  网络、翻页、上下拉
//@interface XUIViewController : UIViewController <XUIRefreshFooterDelegate, XUIRefreshHeaderDelegate>
//
//@property (copy, nonatomic) void(^popBlock)();
//@property (strong, nonatomic) MBProgressHUD *hud;
//@property (strong, nonatomic) UIColor *navBackgroundColor;
//@property (strong, nonatomic) XFullViewNav *fullManNav;
//@property (assign, nonatomic) CGRect lastFrame;
//
//- (void)addRequest:(ASIHTTPRequest *)request;
//- (void)clearAllRequest;
//- (void)dealloc;
//
////  进度条
//- (void)showFlowerInView:(UIView *)view;
//- (void)showFlowerInView:(UIView *)view message:(NSString *)message;
//- (void)hideFlower;
//
//
////  必须执行 [super method]
//- (void)requestFinished:(ASIHTTPRequest *)request;
//- (void)requestFailed:(ASIHTTPRequest *)request;
//
////  失败时 result 为 nil,NSDictionary info 方便扩展
//- (void)receiveWithInfo:(NSDictionary *)info result:(id)result;
//
////  上下拉
//- (void)addHeaderPullWithTable:(UITableView *)tab delegate:(id)delegate;
//- (void)addFooterPullWithTable:(UITableView *)tab delegate:(id)delegate;
//
//- (void)removeHeaderPullView;
//- (void)removeFooterPullView;
//
//- (void)pullHeaderEvent;
//- (void)pullFooterEvent;
//
//- (void)closeRefresh;
//
//@end
