//
//  UIButton+isaCategory.h
//  JMCategory
//
//  Created by xserver on 2016/11/16.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (isaCategory)

/**
 不能点击

 @param delay 秒
 */
- (void)isaDisabledDelaySeconds:(NSTimeInterval)delay;

@end
