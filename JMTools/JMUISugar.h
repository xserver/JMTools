//
//  JMUISugar.h
//  JMUIQuickMake
//
//  Created by xserver on 15/4/4.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIAlertController (JMUISugar)
- (void)showForController:(UIViewController *)ctrl;
@end


#ifndef JMUIQuickMake_JMUISugar_h
#define JMUIQuickMake_JMUISugar_h

NS_INLINE UINavigationController *
QMNavigationCtrl(UIViewController *root) {
    return [[UINavigationController alloc] initWithRootViewController:root];
}

#pragma mark - UIAlertController
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


#endif
