//
//  UIAlertController+JMPresent.m
//  JMCategory
//
//  Created by xserver on 16/4/11.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIAlertController+JMPresent.h"

@implementation UIAlertController (JMPresent)

+ (instancetype)jmAlertTitle:(NSString *)title message:(NSString *)message {
    return [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}

- (UIAlertController *)jmAddActionTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    
    [self addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:handler]];
    
    return self;
}


- (void)jmPresentToController:(UIViewController *)ctrl {
    
    if (ctrl == nil) {
        ctrl = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    
    [ctrl presentViewController:self animated:YES completion:nil];
}

- (UIAlertController *)addActions:(id)firstObject, ... {
    
    if (firstObject) {
        
        @autoreleasepool {
            
            va_list list;
            va_start(list, firstObject);
            id item = firstObject;
            
            int index = 0;
            NSString *title;
            
            do {
                
                NSLog(@"item %@  index = %@", item, @(index));
                
                if (index % 2 == 0) {
                    
                    if ([item isKindOfClass:[NSString class]]) {
                        title = [item copy];
                    } else {
                        break;
                    }
                    
                } else {
                    
                    UIAlertAction *action;
                    if ([item isEqual:[NSNull null]]) {
                        action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:nil];
                    } else {
                        action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:item];
                    }
                    
                    [self addAction:action];
                }
                
                index++;
                
            } while ((item = va_arg(list, id)));
        
            va_end(list);
        }
    }
    
    return self;
}

@end