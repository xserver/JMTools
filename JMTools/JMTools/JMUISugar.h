//
//  JMUISugar.h
//  JMUIQuickMake
//
//  Created by xserver on 15/4/4.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JMUISugar : NSObject 
@end


@interface UIAlertController (JMUISugar)

- (void)showForController:(UIViewController *)ctrl;

@end




#ifndef JMUIQuickMake_JMUISugar_h
#define JMUIQuickMake_JMUISugar_h

NS_INLINE UINavigationController *
QMNavigationCtrl(UIViewController *root) {
    return [[UINavigationController alloc] initWithRootViewController:root];
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


#pragma mark - UIAlertController

//NS_INLINE UIAlertController *
//QMAlertCtrl(NSString *title, NSString *message) {
//    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//}

//  确定 or 取消
NS_INLINE UIAlertController *
QMAlertCtrl(NSString *title, NSString *message,
            NSString *title1, void(^handle1)(UIAlertAction *action),
            NSString *title2, void(^handle2)(UIAlertAction *action)) {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (title1) {
        [alert addAction:[UIAlertAction actionWithTitle:title1 style:UIAlertActionStyleDefault handler:handle1]];
    }
    
    if (title2) {
        [alert addAction:[UIAlertAction actionWithTitle:title2 style:UIAlertActionStyleDefault handler:handle2]];
    }
    
    return alert;
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
