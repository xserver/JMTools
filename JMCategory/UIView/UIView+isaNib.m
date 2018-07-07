//
//  UIView+isaNib.m
//  JMCategory
//
//  Created by xserver on 2016/10/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIView+isaNib.h"

@implementation UIView (isaNib)

+ (instancetype)isaLoadNibWithName:(NSString *)name {
    return [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] firstObject];
}

+ (instancetype)isaLoadNib {
    
    NSString *name = NSStringFromClass(self.class);
    return [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] firstObject];
}

+ (UINib *)nibWithSameClassName {
    return [UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil];
}

@end
