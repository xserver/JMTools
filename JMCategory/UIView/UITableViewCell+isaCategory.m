//
//  UITableViewCell+isaCategory.m
//  JMCategory
//
//  Created by xserver on 2016/10/26.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UITableViewCell+isaCategory.h"

@implementation UITableViewCell (isaCategory)

- (UITableView *)isaTableView {
    
    id view = [self superview];
    
    while (view && [view isKindOfClass:[UITableView class]] == NO) {
        view = [view superview];
    }
    
    return view;
}

@end
