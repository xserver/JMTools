//
//  JMButtonGroup.h
//  buttongroup
//
//  Created by xserver on 15/4/15.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  通过修改 button 的 seleted 属性
 */
@interface JMButtonGroup : NSObject


//  默认 multipleChoice = NO, single 单选模式
@property (nonatomic, assign) BOOL multipleChoice;


//  回调必填，否则 selected 的赋值不生效
@property (nonatomic, copy) void(^setNormalStyle  ) (UIButton *btn);
@property (nonatomic, copy) void(^setSelectedStyle) (UIButton *btn);


//  一些返回
@property (nonatomic, readonly) NSInteger selectedCount;
@property (nonatomic, readonly) NSArray  *selectedButtons;
@property (nonatomic, readonly) BOOL isSelected;


- (instancetype)initWithButtons:(NSArray *)btns;
- (void)addButton:(UIButton *)btn;

@end
