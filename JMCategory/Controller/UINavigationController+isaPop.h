//
//  UINavigationController+isaPop.h
//  JMCategory
//
//  Created by xserver on 2016/10/29.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (isaPop)


/**
 连续 pop 几个 ViewController

 @param count 几个

 @return pop 后的 ViewController
 */
- (UIViewController *)isaPopViewControllerWithCount:(NSInteger)count;

@end
