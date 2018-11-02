////
////  XIJMXUIWindow.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XIJMXUIeWindow.h"
//#import "XUIe+XC.h"
//#import <AssetsLibrary/AssetsLibrary.h>
//#import "XSystem.h"
//#import "ASIHTTPRequest.h"
//
//@interface XIJMXUIeWindow () <UIScrollViewDelegate>
//{
//    ASIHTTPRequest *request;
//}
//
//@property (weak, nonatomic) IBOutlet UIView *contentView;
//
//@property (weak, nonatomic) IBOutlet UIButton *saveButton;
//@property (weak, nonatomic) IBOutlet UIButton *closeButton;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *saveActivity;
//
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadActivity;
//
//@property (strong, nonatomic) XUIeView *iJMXUIeView;
//
//@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
//
//@property (weak, nonatomic) IBOutlet UIView *toolbar;
//@property (strong, nonatomic) UIScrollView *scroll;
//@end
//
//@implementation XIJMXUIeWindow
//
//static XIJMXUIeWindow *shared = nil;
//
//- (void)dealloc {
//    [request cancelAuthentication];
//    request = nil;
//    _iJMXUIeView = nil;
//    shared = nil;
//}
//
//- (void)awakeFromNib {
//    [_saveButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
//    [_closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
//
//    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction)];
//    [self addGestureRecognizer:tap1];
//    
//    UITapGestureRecognizer * tap2    = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    [tap2 setNumberOfTapsRequired:2];
//    [self addGestureRecognizer:tap2];
//    
//    [tap1 requireGestureRecognizerToFail:tap2];
//    
//    _tipsLabel.alpha = 0;
//    _saveActivity.hidden = YES;
//    _loadActivity.hidden = YES;
//    
//    _toolbar.frame = CGRectMake(0, 20, XWidth, 44);
//    _iJMXUIeView = [[XUIeView alloc] init];
//    
//    CGFloat offset = _toolbar.frame.origin.y + _toolbar.frame.size.height;
//    _scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, offset, XWidth, XHigth - offset + 20)];
//    _scroll.maximumZoomScale = 2;
//    _scroll.delegate = self;
//    [self addSubview:_scroll];
//}
//
//+ (instancetype)makeObj {
//    XIJMXUIeWindow *win = [XIJMXUIeWindow viewWithNib:@"XIJMXUIeWindow"];
//    win.windowLevel = UIWindowLevelNormal;
//    return win;
//}
//
//+ (instancetype)showWithIJMXUIe:(XUIe *)iJMXUIe {
//    
//    [self closeWindow];
//    shared = [self makeObj];
//
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    dispatch_async(queue, ^{
//        [shared setIJMXUIe:iJMXUIe];
//    });
//    [shared makeKeyAndVisible];
//    return shared;
//}
//
//+ (instancetype)showWithIJMXUIeURL:(NSURL *)url {
//    
//    [self closeWindow];
//    shared = [self makeObj];
//
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        [shared setIJMXUIeURL:url];
//    });
//    
//    [shared makeKeyAndVisible];
//
//    return shared;
//}
//
//+ (void)closeWindow {
//    if (shared != nil) {
//        
//        [[shared subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
//        [shared removeFromSuperview];
//        shared = nil;
//    }
//}
//
//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
//- (void)closeAction {
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        _contentView.alpha = 0;
//        _contentView.frame = CGRectMake(XWidth/2, XHigth/2, 0, 0);
//    } completion:^(BOOL finished){
//        
//        [XIJMXUIeWindow closeWindow];
//    }];
//}
//
//- (void)saveAction {
//
//    _saveButton.hidden = YES;
//    [_saveActivity setHidden:NO];
//    [_saveActivity startAnimating];
//    
////    XUIeWriteToSavedPhotosAlbum(_iJMXUIeView.iJMXUIe, self, @selector(iJMXUIe:didFinishSavingWithError:contextInfo:), nil);
//    
//    XUIeWriteToSavedPhotosAlbum(_iJMXUIeView.iJMXUIe, self, @selector(iJMXUIe:didFinishSavingWithError:contextInfo:), nil);
//}
//
//- (void)tipsNotReadIJMXUIePower {
//    
//    [[XToolbox alertWithTitle:@"提示" message:@"无法访问您的照片，请授权：\n『设置-隐私-照片-享志』"] show];
//}
//
//- (void)iJMXUIe:(XUIe *)iJMXUIe didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo {
//    [_saveActivity stopAnimating];
//    [_saveActivity setHidden:YES];
//    
//    if (error){
//        _tipsLabel.text = @"保存失败";
//        [self tipsNotReadIJMXUIePower];
//    }else {
//        [UIView animateWithDuration:0.3 animations:^{
//            _tipsLabel.text = @"保存成功";
//            _tipsLabel.alpha = 1;
//        }];
//        
//        {
//            double delayInSeconds = 1;
//            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//                
//                [UIView animateWithDuration:0.3 animations:^{
//                    _tipsLabel.alpha = 0;
//                }];
//            });
//        }
//    }
//}
//- (ASIHTTPRequest *)getCurrentRequest {
//    return request;
//}
//- (void)setIJMXUIeURL:(NSURL *)url {
//    _loadActivity.hidden = NO;
//    [_loadActivity startAnimating];
//
//    __block __weak id selfb = self;
//    request = [ASIHTTPRequest requestWithURL:url];
//    [request setPersistentConnectionTimeoutSeconds:60];
//    [request setShouldAttemptPersistentConnection:NO];
//    [request setValidatesSecureCertificate:NO]; //  SSL
//    [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:NO];
//    [request setTimeOutSeconds:30];
//    [request startAsynchronous];
//    
//    [request setCompletionBlock:^{
//        
////        ASIHTTPRequest *re = (ASIHTTPRequest *)[selfb request];
//        NSData *responseData = [[selfb getCurrentRequest] responseData];
//        [selfb setIJMXUIe:[responseData iJMXUIe]];
//        [selfb stopActivity];
//    }];
//    [request setFailedBlock:^{
//        [XToolbox alertWithTitle:@"提示" message:@"加载失败"];
//    }];
//}
//
//- (void)stopActivity {
//    _loadActivity.hidden = YES;
//    [_loadActivity stopAnimating];
//}
//
//- (void)setIJMXUIe:(XUIe *)iJMXUIe {
//
//    CGFloat width = CGIJMXUIeGetWidth(iJMXUIe.CGIJMXUIe)/2;
//    CGFloat height = CGIJMXUIeGetHeight(iJMXUIe.CGIJMXUIe)/2;
//    height = XWidth * (height/width);
//    width = XWidth;
//    
//    //  居中
//    if ((XHigth - 44) > height) {
//        
//        _iJMXUIeView.frame = CGRectMake(0, 0, width, height);
//        _iJMXUIeView.center = CGPointMake(XWidth/2, _scroll.frame.size.height/2);
//    }else{
//        CGFloat offsetY = 0;
//        CGFloat offsetX = (XWidth - width)/2;
//        _iJMXUIeView.frame = CGRectMake(offsetX, offsetY, width, height);
//    }
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//        _iJMXUIeView.iJMXUIe = iJMXUIe;
//        
//        _scroll.contentSize = CGSizeMake(width, height);
//        [_scroll addSubview:shared.iJMXUIeView];
//        [shared.iJMXUIeView setNeedsLayout];
//    });
//}
//
////  这个可以移到点击的中心
//- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
//{
//    CGRect zoomRect;
//    zoomRect.size.height = self.frame.size.height / scale;
//    zoomRect.size.width  = self.frame.size.width  / scale;
//    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
//    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
//    return zoomRect;
//}
//
//- (void)handleTap:(UITapGestureRecognizer *)tap {
//    
////    float newScale = _scroll.zoomScale * 1.5;
////    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[tap locationInView:tap.view]];
////    [_scroll zoomToRect:zoomRect animated:YES];
//    
//    if (_scroll.zoomScale < 1.1) {
//        _scroll.zoomScale = 1.5;
//    }else{
//        _scroll.zoomScale = 1;
//    }
//    
//}
//
//#pragma mark - scroll delegate
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    return self.iJMXUIeView;
//}
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
//    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
//    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
//    _iJMXUIeView.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
//}
//@end
