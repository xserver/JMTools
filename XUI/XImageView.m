////
////  XIJMXUIeView.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XIJMXUIeView.h"
//#import <AssetsLibrary/AssetsLibrary.h>
//#import "XSystem.h"
//
//@interface XIJMXUIeView ()
//@property (weak, nonatomic) IBOutlet UIButton *saveButton;
//@property (weak, nonatomic) IBOutlet UIButton *closeButton;
//
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *saveActivity;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadActivity;
//
//@property (strong, nonatomic) XUIeView *iJMXUIeView;
//@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
//
//@property (weak, nonatomic) IBOutlet UIView *toolbar;
//
//@end
//@implementation XIJMXUIeView
//
//
//static XIJMXUIeView *shared = nil;
//
//- (void)awakeFromNib {
//    
//    [_saveButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
//    [_closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
//    
//
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction)];
//    [self addGestureRecognizer:tap];
//    
//    _tipsLabel.alpha = 0;
//    _saveActivity.hidden = YES;
//    _toolbar.frame = CGRectMake(0, 20, XWidth, 44);
//}
//
//+ (instancetype)showInView:(UIView *)view iJMXUIe:(XUIe *)iJMXUIe {
////    if (shared != nil) {
////        [shared removeFromSuperview];
////        shared = nil;
////    }
//    
//    if (shared == nil) {
//        shared = [XIJMXUIeView viewWithNib:@"XIJMXUIeView"];
//    }
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    dispatch_async(queue, ^{
////        [shared setIJMXUIe:iJMXUIe];
//    });
//    
////    [shared setIJMXUIe:iJMXUIe];
//    [view addSubview:shared];
//    return shared;
//}
//
//+ (instancetype)showInView:(UIView *)view iJMXUIeURL:(NSURL *)url {
//
//    if (shared == nil) {
//        shared = [XIJMXUIeView viewWithNib:@"XIJMXUIeView"];
//    }
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    dispatch_async(queue, ^{
//        [shared setIJMXUIeURL:url];
//    });
//    
//    [view addSubview:shared];
//    return shared;
//}
//
//+ (void)close {
//    
//}
//
//- (void)setIJMXUIeURL:(NSURL *)url {
//    _loadActivity.hidden = NO;
//    [_loadActivity startAnimating];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    XUIe *iJMXUIe = [XUIe iJMXUIeWithData:data];
//    [self setIJMXUIe:iJMXUIe];
//    [_loadActivity stopAnimating];
//    _loadActivity.hidden = YES;
//}
//
//- (void)setIJMXUIe:(XUIe *)iJMXUIe {
//
//    //  转菊花
//    //  加载图片
//    //  显示，取消菊花
//    NSLog(@"1");
//    //    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    
//    
//    //    dispatch_async(_queue, ^{
//    NSLog(@"2");
//    
//    XUIeView *iv = [[XUIeView alloc] init];
//    CGFloat width = CGIJMXUIeGetWidth(iJMXUIe.CGIJMXUIe)/2;
//    CGFloat height = CGIJMXUIeGetHeight(iJMXUIe.CGIJMXUIe)/2;
//    height = XWidth * (height/width);
//    width = XWidth;
//    
//    //  居中
//    if ((XHigth - 44) > height) {
//        
//        CGFloat offsetY = (XHigth / 2) + 44;
//        iv.frame = CGRectMake(0, offsetY, width, height);
//        iv.center = CGPointMake(XWidth/2, offsetY);
//    }else{
//        CGFloat offsetY = 70;
//        CGFloat offsetX = (XWidth - width)/2;
//        iv.frame = CGRectMake(offsetX, offsetY, width, height);
//    }
//    NSLog(@"3");
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"4");
//        iv.iJMXUIe = iJMXUIe;
//        shared.iJMXUIeView = iv;
//        [shared addSubview:iv];
//        
//        NSLog(@"5 %@" ,iv);
//    });
//    //    });
//    
//}
//
//- (void)closeAction {
//    [shared removeFromSuperview];
//
//}
//
//- (void)saveAction {
//    
//    _saveButton.hidden = YES;
//    [_saveActivity setHidden:NO];
//    [_saveActivity startAnimating];
//    
//    //    XUIeWriteToSavedPhotosAlbum(_iJMXUIeView.iJMXUIe, self, @selector(iJMXUIe:didFinishSavingWithError:contextInfo:), nil);
//    
//    //    XUIe *iJMXUIe = [_iJMXUIeView.iJMXUIe xcResizeWithMinWidth:100];
//    XUIeWriteToSavedPhotosAlbum(_iJMXUIeView.iJMXUIe, self, @selector(iJMXUIe:didFinishSavingWithError:contextInfo:), nil);
//}
//
//- (void)tipsNotReadIJMXUIePower {
//    
//    [[XToolbox alertWithTitle:@"提示" message:@"无法访问您的照片，请授权：\n『设置-隐私-照片-享志』"] show];
//    
//    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"无法访问您的照片，请授权：\n『设置-隐私-照片-享志』" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//    //    [alert show];
//}
////
////- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
////    [[UIApplication sharedApplication] openURL:[@"prefs:root=General" URL]];
////}
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
//        double delayInSeconds = 1;
//        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//            
//            [UIView animateWithDuration:0.3 animations:^{
//                _tipsLabel.alpha = 0;
//            }];
//        });
//        }
//    }
//}
//@end
