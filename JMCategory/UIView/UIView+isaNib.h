//
//  UIView+isaNib.h
//  JMCategory
//
//  Created by xserver on 2016/10/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (isaNib)

//  反正 同名的 nib 文件的view
+ (instancetype)isaLoadNib;


+ (instancetype)isaLoadNibWithName:(NSString *)name;


@end
