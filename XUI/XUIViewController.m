////
////  XUIViewController.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XUIViewController.h"
//
//@interface XUIViewController ()
//
//@property (assign) BOOL refreshing;
//
//@property (strong, nonatomic) XUIRefreshHeader *refHeader;
//@property (strong, nonatomic) XUIRefreshFooter *refFooter;
//@property (strong, nonatomic) NSMutableDictionary *requestQueues;   //request
//
//@end
//
//
//@implementation XUIViewController
//
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}
//
//- (BOOL)prefersStatusBarHidden {
//    return NO;
//}
//
//- (void)dealloc {
//
//    NSLog(@"");
//    if (_hud != nil) {
//        [_hud hide:YES];
//        _hud = nil;
//    }
//    
//    self.refFooter = nil;
//    self.refHeader = nil;
//
//    [self clearAllRequest];
//    _requestQueues = nil;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self.view addSubview:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
//}
//
//#pragma mark 菊花
//- (void)showFlowerInView:(UIView *)view {
//    [self showFlowerInView:view message:@"加载中"];
//}
//
//- (void)showFlowerInView:(UIView *)view message:(NSString *)message {
//    
//    if (_hud != nil) {
//        [_hud hide:YES];
//        _hud = nil;
//    }
//    
//    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    _hud.mode = MBProgressHUDModeIndeterminate;
//    _hud.labelText = message;
//}
//
//- (void)hideFlower {
//    
//    if (_hud != nil) {
//        [_hud hide:YES];
////        _hud.mode = MBProgressHUDModeCustomView;
////        _hud.labelText = @"  Done  ";
////        _hud.customView = [[XUIeView alloc] initWithIJMXUIe:[XUIe iJMXUIeNamed:@"37x-Checkmark.png"]];
////        [_hud hide:YES afterDelay:0.6];
//    }
//}
//
//#pragma mark Refresh Delegate
//- (void)pullHeaderEvent:(XUIRefreshHeader *)view {
//    if (_refreshing == NO) {
//        _refreshing = YES;
//        [self pullHeaderEvent];
//    }
//}
//- (void)pullFooterEvent:(XUIRefreshFooter *)view {
//    if (_refreshing == NO) {
//        _refreshing = YES;
//        [self pullFooterEvent];
//    }
//}
//- (void)closeRefresh {
//    if (_refreshing) {
//        _refreshing = NO;
//        [_refHeader close];
//        [_refFooter close];
//    }
//}
//
//#pragma mark - get
//- (XFullViewNav *)fullManNav {
//    if (_fullManNav == nil) {
//        _fullManNav = [XFullViewNav makeObj];
//    }
//    return _fullManNav;
//}
//
//#pragma mark - ASI
//- (void)requestFinished:(ASIHTTPRequest *)request {
//
//    [self.requestQueues removeObjectForKey:[request.userInfo objectForKey:@"key"]];
//    [self hideFlower];
//}
//
//- (void)requestFailed:(ASIHTTPRequest *)request {
//    [self closeRefresh];
//    [self.requestQueues removeObjectForKey:[request.userInfo objectForKey:@"key"]];
//    [self hideFlower];
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"访问失败，请检查网络后重试。"
//                                                    message:@""
//                                                   delegate:nil
//                                          cancelButtonTitle:nil
//                                          otherButtonTitles:@"确认", nil];
//    
//    [alert show];
//    
////    NSError *error = [request error];
////    [Toolbox alertWithTitle:@"Request 错误提示" message:[error domain]];
//}
//
//- (NSMutableDictionary *)requestQueues {
//    if (_requestQueues == nil) {
//        _requestQueues = [NSMutableDictionary dictionaryWithCapacity:6];
//    }
//    return _requestQueues;
//}
//
//- (void)clearAllRequest {
//
//    [[self.requestQueues allValues] makeObjectsPerformSelector:@selector(clearDelegatesAndCancel)];
//    [self.requestQueues removeAllObjects];
//}
//
//- (void)clearRequestWithKey:(NSString *)key {
//    
//    if ([self.requestQueues objectForKey:key] != nil) {
//        ASIHTTPRequest *request = [_requestQueues objectForKey:key];
//        [request clearDelegatesAndCancel];
//        [_requestQueues removeObjectForKey:key];
//    }
//}
//
//- (void)addRequest:(ASIHTTPRequest *)request {
//    
//    if ([request isKindOfClass:[ASIHTTPRequest class]]) {
//        NSString *key = [request.userInfo objectForKey:@"key"];
//        NSAssert( key != nil, @"request.userInfo key 不能为 NUll");
//        
//        [self clearRequestWithKey:key];
//        [self.requestQueues setObject:request forKey:key];
//    }
//}
//
//#pragma mark - Pull
//- (void)addHeaderPullWithTable:(UITableView *)tab delegate:(id)delegate {
//    self.refHeader = [XUIRefreshHeader makeWithTableView:tab];
//    self.refHeader.delegate = delegate;
//}
//- (void)addFooterPullWithTable:(UITableView *)tab delegate:(id)delegate {
//    self.refFooter = [XUIRefreshFooter makeWithTableView:tab];
//    self.refFooter.delegate = delegate;
//}
//- (void)removeHeaderPullView {
//    if (self.refHeader != nil) {
//        [self.refHeader removeFromSuperview];
//        self.refHeader = nil;
//    }
//}
//- (void)removeFooterPullView {
//
//    if (self.refFooter != nil) {
//        [self.refFooter removeFromSuperview];
//        self.refFooter = nil;
//    }
//}
//
//- (void)pullHeaderEvent {
//    [self.refHeader performSelector:@selector(close) withObject:nil afterDelay:3];
//};
//- (void)pullFooterEvent {
//    [self.refFooter performSelector:@selector(close) withObject:nil afterDelay:3];
//};
//
//@end
