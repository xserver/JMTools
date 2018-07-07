//
//  UIAlertController+JMPresent.h
//  JMCategory
//
//  Created by xserver on 16/4/11.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (JMPresent)

+ (instancetype)jmAlertTitle:(NSString *)title message:(NSString *)message;


- (UIAlertController *)jmAddActionTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;


- (void)jmPresentToController:(UIViewController *)ctrl;

//  这颗糖有毒，别用
- (UIAlertController *)addActions:(id)action, ...;

@end
