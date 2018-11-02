////
////  XUISharedView.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XUISharedView.h"
//#import "XSharedObj.h"
//#import "ThirdParty.h"
//#import "ReportCtrl.h"
//#import <QuartzCore/QuartzCore.h>
//
//@interface XUISharedView () <UIGestureRecognizerDelegate>
//
//@property (weak, nonatomic) IBOutlet UIView *collectView;
//@property (weak, nonatomic) IBOutlet UIButton *sinaButton;
//@property (weak, nonatomic) IBOutlet UIButton *wxSessionButton;
//@property (weak, nonatomic) IBOutlet UIButton *wxTimelineButton;
//@property (weak, nonatomic) IBOutlet UIButton *evernoteButton;
//@property (weak, nonatomic) IBOutlet UIButton *linkButton;
//
//
//@property (weak, nonatomic) IBOutlet UIButton *reportButton;
//@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
//
//
//@property (weak, nonatomic) IBOutlet UIView *maskView;
//@property (strong, nonatomic) XSharedObj *sharedObj;
//
//@property (strong, nonatomic) UITapGestureRecognizer *tap;
//@property (strong, nonatomic) NSArray *buttons;
//
//@property (weak, nonatomic) UIViewController *ctrl;
//@end
//
//@implementation XUISharedView
//
//- (void)awakeFromNib {
//    
//    _buttons = @[_sinaButton, _wxTimelineButton, _wxSessionButton, _evernoteButton, _linkButton, _reportButton];
//    for (UIButton *btn in _buttons) {
//        btn.layer.cornerRadius = 8;
//        btn.titleEdgeInsets = UIEdgeInsetsMake(70, 0, 0, 0);
//        [btn addTarget:self action:@selector(sharedAction:) forControlEvents:UIControlEventTouchUpInside];
//        [btn setNeedsDisplay];
//    }
////    _evernoteButton.hidden = YES;
//    
//    _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(acCancel)];
//    _tap.delegate = self;
//    [_maskView addGestureRecognizer:_tap];
//    
//    if (XIsIOS7) {
//        self.frame = CGRectMake(0, 0, XWidth, XHigth);
//    }else{
//        self.frame = CGRectMake(0, 20, XWidth, XHigth);
//    }
//
//    _maskView.frame = self.bounds;
//    _collectView.frame = CGRectMake(0, XHigth - 178, XWidth, 178);//- 50
////    _reportButton.frame = CGRectMake(0, XHigth - 44*2 - 1, XWidth, 44);
////    _cancelButton.frame = CGRectMake(0, XHigth - 44, XWidth, 44);
//    
////    [_reportButton addTarget:self action:@selector(acReport:) forControlEvents:UIControlEventTouchUpInside];
////    [_cancelButton addTarget:self action:@selector(acCancel) forControlEvents:UIControlEventTouchUpInside];
//}
//
//
//- (void)dealloc {
//    _sharedObj = nil;
//    _tap = nil;
//}
//
//+ (id)makeObj {
//    return [UIWindow viewWithNib:@"XUISharedView"];
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//
//    if ([touch.view isKindOfClass:[UIButton class]]) {
//        return NO;
//    }
//    return YES;
//}
//
//+ (instancetype)sharedObj:(XSharedObj *)obj {
//    
////  show in window
//    XUISharedView *view = [XUISharedView makeObj];
//    view.sharedObj = obj;
//    view.alpha = 0;
//    [[AppScene window] addSubview:view];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        view.alpha = 1;
//    }];
//    return view;
//}
//
//- (void)setHideEvernote:(BOOL)hide {
//    
//    _evernoteButton.hidden = hide;
//    if (hide) {
//        _linkButton.center = CGPointMake(268, 44);
//        _reportButton.center = CGPointMake(45, 112);
//    }else{
//        _evernoteButton.center = CGPointMake(268, 44);
//        _linkButton.center = CGPointMake(45, 112);
//        _reportButton.center = CGPointMake(118, 112);
//    }
//
////    CGFloat start = 20 + 27;
////    CGFloat offset = show ? (54 + 22) : (54 + 56);
////    _evernoteButton.hidden = !show;
////    
////    for (UIButton *btn in _buttons) {
////        btn.center = CGPointMake(start, 47);
////        start += offset;
////    }
//}
//
//#pragma mark - action
//- (IBAction)acCancel {
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        self.alpha = 0;
//    } completion:^(BOOL finished){
//        
//        if (finished) {
//            [self removeFromSuperview];
//        }
//    }];
//}
//
//- (IBAction)acReport:(id)sender {
//
//    ReportCtrl *ctrl = [[ReportCtrl alloc] init];
//    [ctrl setArticleID:_sharedObj.linkID];
//    ctrl.navBackgroundColor = [[AppScene sharedInstance] currentNavBgColor];
//    [[[AppScene sharedInstance] currentNavCtrl] pushViewController:ctrl animated:YES];
//
//    [self acCancel];
//}
//
//- (void)sharedAction:(UIButton *)btn {
//    
//    if ([_sinaButton isEqual:btn]) {
//        _sharedObj.platform = @"weibo";
//        _sharedObj.url = [_sharedObj.url stringByAppendingString:@"&platform=weibo"];
//        [[ThirdParty sharedInstance] send2WeiboLink:_sharedObj];
//        [self acCancel];
//    }
//    if ([_wxSessionButton isEqual:btn]) {
//        _sharedObj.platform = @"wechat_session";
//        _sharedObj.url = [_sharedObj.url stringByAppendingString:@"&platform=wechat_session"];
//        _sharedObj.wxScene = WXSceneSession;
//        [[ThirdParty sharedInstance] send2WeixinLink:_sharedObj];
//        [self acCancel];
//    }
//    if ([_wxTimelineButton isEqual:btn]) {
//        _sharedObj.platform = @"wechat_timeline";
//        _sharedObj.url = [_sharedObj.url stringByAppendingString:@"&platform=wechat_timeline"];
//        _sharedObj.wxScene = WXSceneTimeline;
//        [[ThirdParty sharedInstance] send2WeixinLink:_sharedObj];
//        [self acCancel];
//    }
//    if ([_evernoteButton isEqual:btn]) {
//        _sharedObj.platform = @"evernote";
//        [[ThirdParty sharedInstance] send2Evernote:_sharedObj];
//        [self acCancel];
//    }
//    if ([_reportButton isEqual:btn]) {
//        [self acReport:nil];
//    }
//    if ([_linkButton isEqual:btn]) {
//        //  copy
//        _sharedObj.url = [_sharedObj.url stringByAppendingString:@"&platform=default"];
//        [UIPasteboard generalPasteboard].string = _sharedObj.url;
//        [self acCancel];
//    }
//}
//
//@end
