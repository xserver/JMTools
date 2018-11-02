////
////  XUITabBarCtrl.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XUITabBarCtrl.h"
//#import "XUIToolbar.h"
//#import "XFullViewOper.h"
//
//@interface XUITabBarCtrl ()
//@property (copy,   nonatomic) NSArray *viewControllers;
//@property (strong, nonatomic) XUIToolbar *toolbar;
//
//@property (assign) NSUInteger selectIndex;
//@property (weak,   nonatomic) UIViewController *currentCtrl;
//
//@property (strong, nonatomic) XFullViewOper *fullMan;
//@property (weak,   nonatomic) UIScrollView *lastScrollView;
//
//@property (strong, nonatomic) XUIeView *redView;
//@end
//
//@implementation XUITabBarCtrl
//@synthesize selectIndex = _selectIndex;
//
//+ (instancetype)sharedInstance {
//    static dispatch_once_t onceToken;
//    static id obj;
//    dispatch_once(&onceToken, ^{
//        obj = [[XUITabBarCtrl alloc] init];
//    });
//    return obj;
//}
//
//- (id)init {
//    if (self = [super init]) {
//        _selectIndex = -1;
//        _fullMan = [XFullViewOper makeObj];
//        _barHeight = 49;
//    }
//    return self;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self.view addSubview:self.toolbar];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark - get
//- (XUIToolbar *)toolbar {
//    if (_toolbar == nil) {
//        _toolbar = [XUIToolbar makeObjWithCount:self.count];
//        _toolbar.frame = CGRectMake(0, XHigth - _barHeight, XWidth+1, _barHeight);
//        for (UIButton *btn in _toolbar.buttons) {
//            [btn setOriginY:0];
//            [btn setSizeHeight:50];
//        }
////        _toolbar.bgView.alpha = 0.9;
//        [_toolbar setTitleFont:[UIFont systemFontOfSize:10]];
//        [_toolbar setTitleColor:[UIColor blackColor] forState:0];
//        
//        __weak id selfb = self;
//        _toolbar.toolbarEvent = ^(NSUInteger index) {
//            [selfb setSelectIndex:index];
//        };
//    }
//
//    return _toolbar;
//}
//
//- (XUIeView *)redView {
//    if (_redView == nil) {
//        _redView = [[XUIeView alloc] initWithFrame:CGRectMake(288, 28, 11, 11)];
//        _redView.iJMXUIe = [XUIe iJMXUIeNamed:@"tabbar_new_msg"];
////        _redView.backgroundColor = [UIColor blueColor];
//        _redView.hidden = YES;
//    }
//    return _redView;
//}
//
//- (void)busHideMyspaceFlag:(BOOL)hide {
//    
//    self.redView.hidden = hide;
//    if (hide == NO) {
//
//        [self.toolbar addSubview:self.redView];//bringSubviewToFront
//        [self.redView setNeedsDisplay];
//    }
//    
//    //  Out of control
//    MySpaceCtrl *ctrl = [[[self.viewControllers objectAtIndex:3] viewControllers] objectAtIndex:0];
//    [ctrl setHideRedView:hide];
//}
//
//#pragma mark - action
//- (void)setScrollView:(UIScrollView *)scroll {
//    [_fullMan setScrollView:scroll toolbar:self.toolbar];
//}
//
//- (void)setViewControllers:(NSArray *)viewControllers {
//    for (id ctrl in viewControllers) {
//        if ([ctrl isKindOfClass:[UIViewController class]] == NO) {
//            NSAssert(NO, @"XUITabBarCtrl:setViewControllers 数据类型错误");
//        }
//    }
//    _viewControllers = viewControllers;
//    _count = viewControllers.count;
//}
//
//- (void)setTitles:(NSArray *)titles forState:(UIControlState)state {
//    [self.toolbar setTitles:titles forState:state];
//}
//- (void)setIJMXUIes:(NSArray *)iJMXUIes forState:(UIControlState)state {
//    [self.toolbar setIJMXUIes:iJMXUIes forState:state];
//}
//
//- (void)setBackgroundIJMXUIe:(XUIe *)iJMXUIe {
//    [self.toolbar setBackgroundIJMXUIe:iJMXUIe];
//}
//
//- (NSUInteger)selectIndex {
//    return _selectIndex;
//}
//
//- (void)highlightedItem:(NSUInteger)index {
//    
//    static __weak UIButton *lastButton;
//    if (lastButton != nil) {
//        lastButton.selected = NO;
//    }
//    
//    UIButton *btn = [self.toolbar buttonAtIndex:index];
//    btn.selected = YES;
//    lastButton = btn;
//}
//
//- (UIViewController *)currentCtrl {
//    return _currentCtrl;
//}
//- (BOOL)doubleTap:(NSUInteger)index {
//    
//    if (index == _selectIndex) {
//        UINavigationController *nav = [self.viewControllers objectAtIndex:_selectIndex];
//        [nav popToRootViewControllerAnimated:YES];
//        return YES;
//    }
//    return NO;
//}
//
//- (void)setSelectIndex:(NSUInteger)index {
//
//    //  边界判断
//    if (self.viewControllers == nil){
//        return;
//    }
//    
//    if ([self doubleTap:index]) {
//        return;
//    }
//    
//    [self highlightedItem:index];
//    
//    if (_selectIndex != -1) {
//        UIViewController *oldCtrl = [self.viewControllers objectAtIndex:_selectIndex];
//        [oldCtrl.view removeFromSuperview];
//    }
//    
//    UIViewController *newCtrl = [self.viewControllers objectAtIndex:index];
//    newCtrl.view.frame = CGRectMake(0, 0, XWidth, XHigth);
//    [self.view insertSubview:newCtrl.view belowSubview:self.toolbar];
//    
//    _selectIndex = index;
//    _currentCtrl = newCtrl;
//    
//    [self setBackgroundIJMXUIe:[self.backgroundIJMXUIes objectAtIndex:index]];
//}
//
//- (void)setHideTabBar:(BOOL)hideTabBar {
//    if (_hideTabBar == hideTabBar) {
//        return;
//    }
//    
//    _hideTabBar = hideTabBar;
//    _fullMan.isFull = hideTabBar;
//    if (_hideTabBar) {
//        [self hideTabBarAnimation];
//    }else{
//        [self showTabBarAnimation];
//    }
//}
//
//- (void)showTabBarAnimation {
//    [UIView animateWithDuration:0.25 animations:^{
//        [self.toolbar setOriginY:XHigth - _barHeight];
//    }];
//}
//
//- (void)hideTabBarAnimation {
//    [UIView animateWithDuration:0.25 animations:^{
//        [self.toolbar setOriginY:XHigth];
//    }];
//}
//
//#pragma mark - side
//- (void)showRigtView {
//    
//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
//        [self.rigtView setOriginY:20];
//    }
//    [self.rigtView setOriginX:XWidth-40];
////    [self.view.superview insertSubview:self.rigtView belowSubview:self.view];
//    [self.view.superview addSubview:self.rigtView];
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        [self.view setOriginX:-XWidth + 40];
//        [self.rigtView setOriginX:0];
//    }];
//}
//
//- (void)hideRigtView {
//
//    if (self.rigtView != nil) {
//        [UIView animateWithDuration:0.25 animations:^{
//            [self.view setOriginX:0];
//            [self.rigtView setOriginX:XWidth - 40];
//        } completion:^(BOOL finished){
//            [self.rigtView removeFromSuperview];
//        }];
//    }
//}
//
//- (void)hideSideView {
//   //  left or rigt;
//}
//@end
