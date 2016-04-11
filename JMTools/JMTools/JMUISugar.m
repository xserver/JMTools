//
//  JMUISugar.m
//  aaa
//
//  Created by Dragon on 16/4/11.
//  Copyright © 2016年 Dragon. All rights reserved.
//

#import "JMUISugar.h"

@implementation JMUISugar

@end


@implementation UIAlertController (JMUISugar)

- (void)showForController:(UIViewController *)ctrl {
    
    if (ctrl == nil) {
        ctrl = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    
    [ctrl presentViewController:self animated:YES completion:nil];
}

@end