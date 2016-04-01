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

NS_INLINE UILabel *
QMLabel(CGRect frame, NSString *text) {
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = text;
    return lab;
}

NS_INLINE UITextView *
QMTextView(CGRect frame) {
    return [[UITextView alloc] initWithFrame:frame];
}

NS_INLINE UIImageView *
QMImageView(CGRect frame, NSString *image) {
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:frame];
    
    if (image != nil) {
        iv.image = [UIImage imageNamed:image];
    }
    return iv;
}

NS_INLINE UITableView *
QMTableView(CGRect frame, id dataSoure, id delegate, UITableViewStyle style) {
    UITableView *tab = [[UITableView alloc] initWithFrame:frame style:style];
    tab.dataSource = dataSoure;
    tab.delegate = delegate;
    return tab;
}

NS_INLINE UINavigationController *
QMNavigationCtrl(UIViewController *root) {
    return [[UINavigationController alloc] initWithRootViewController:root];
}

//- (UIViewController *)viewController {
//
//    UIResponder *next = self.nextResponder;
//    do {
//        if ([next isKindOfClass:[UIViewController class]]) {
//            return (UIViewController *)next;
//        }
//        next = next.nextResponder;
//
//    } while(next != nil);
//
//    return nil;
//}

#pragma mark - Button
NS_INLINE UIButton *
QMButton(CGRect frame, NSString *title, id target, SEL action) {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    
    if (target != nil) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

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

#pragma mark - 弹窗
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

NS_INLINE UIView *
QMView(CGRect frame) {
    return [[UIView alloc] initWithFrame:frame];
}

#pragma mark - 手势
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
