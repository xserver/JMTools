//
//  JMMaskView.h
//  JMTools
//
//  Created by xserver on 16/5/7.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMMaskView : UIView

@property (nonatomic, copy) void (^appear)(JMMaskView *contentView);

- (void)showInWindow;
- (void)dismiss;

@end
