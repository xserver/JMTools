//
//  JMUISugar.h
//  JMUIQuickMake
//
//  Created by xserver on 15/4/4.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef JMUIQuickMake_JMUISugar_h
#define JMUIQuickMake_JMUISugar_h

NS_INLINE UINavigationController *
QMNavigationCtrl(UIViewController *root) {
    return [[UINavigationController alloc] initWithRootViewController:root];
}

#pragma mark - UIAlertController
NS_INLINE UIAlertController *
MCAlertCtrl(NSString *title, NSString *message, void(^handle)(UIAlertAction *action)) {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action;
    action = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil)
                                      style:UIAlertActionStyleDefault
                                    handler:nil];
    [alert addAction:action];
    
    action = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil)
                                      style:UIAlertActionStyleDefault
                                    handler:handle];
    [alert addAction:action];
    
    return alert;
}

#pragma mark - Button
NS_INLINE UIButton *
QMButton(NSString *title, id target, SEL action) {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    
    if (target != nil) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

#pragma mark - UIBarButtonItem
NS_INLINE UIBarButtonItem *
QMBarItem(NSString *title, id target, SEL action) {
    return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
}

NS_INLINE UIBarButtonItem *
QMBarImageItem(UIImage *image, id target, SEL action) {
    return [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:target action:action];
}

NS_INLINE UIBarButtonItem *
QMBarButtonItem(NSString *title, UIBarButtonItemStyle style, id target, SEL action) {
    return [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
}

#pragma mark - UIAlertView
NS_INLINE UIAlertView *
QMAlertView(NSString *title, NSString *message, NSString *buttonTitle) {
    return [[UIAlertView alloc] initWithTitle:title
                                      message:message
                                     delegate:nil
                            cancelButtonTitle:nil
                            otherButtonTitles:buttonTitle, nil];
}

NS_INLINE UIAlertView *
QMAlertViewTwo(NSString *title, NSString *message, NSString *cancelTitle, NSString *sureTitle) {
    return [[UIAlertView alloc] initWithTitle:title
                                      message:message
                                     delegate:nil
                            cancelButtonTitle:cancelTitle
                            otherButtonTitles:sureTitle, nil];
}

NS_INLINE UIAlertView *
QMAlertTextInput(NSString *title, NSString *message, NSString *cancelTitle, NSString *sureTitle) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:sureTitle, nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    return alert;
}

#pragma mark - UIGestureRecognizer
NS_INLINE UITapGestureRecognizer *
QMTap(id target, SEL action) {
    return [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
}

NS_INLINE UIPanGestureRecognizer *
QMPan(id target, SEL action) {
    return [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
}

NS_INLINE UILongPressGestureRecognizer *
QMLongPress(id target, SEL action) {
    return [[UILongPressGestureRecognizer alloc] initWithTarget:target action:action];
}


#endif
