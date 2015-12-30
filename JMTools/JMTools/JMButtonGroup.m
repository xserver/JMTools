//
//  JMButtonGroup.m
//  buttongroup
//
//  Created by xserver on 15/4/15.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMButtonGroup.h"

@implementation JMButtonGroup
{
    NSMutableSet *_btns;
}

- (instancetype)init {
    if (self = [super init]) {
        _btns = [NSMutableSet setWithCapacity:6];
    }
    return self;
}

- (instancetype)initWithButtons:(NSArray *)btns; {
    if (self = [super init]) {
        _btns = [NSMutableSet setWithArray:btns];
        for (UIButton *btn in _btns) {
            [self addClickEvent:btn];
        }
    }
    return self;
}

- (void)addButton:(UIButton *)btn {
    [_btns addObject:btn];
    [self addClickEvent:btn];
}

- (void)addClickEvent:(UIButton *)btn {
    [btn addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickEvent:(UIButton *)btn {
    
    if (self.multipleChoice) {
        [self multipleChoice:btn];
    }else{
        [self singleChoice:btn];
    }
}

- (void)multipleChoice:(UIButton *)btn {
    
    BOOL selected = !btn.selected;
    if (selected) {
        if (self.setNormalStyle) {
            btn.selected = YES;
            self.setNormalStyle(btn);
        }
    } else {
        if (self.setSelectedStyle) {
            btn.selected = NO;
            self.setSelectedStyle(btn);
        }
    }
}

- (void)singleChoice:(UIButton *)btn {
    
    BOOL selected = !btn.selected;
    if (selected) {

        NSArray *btns = [self selectedButtons];
        for (UIButton *btn in btns) {
            if (self.setNormalStyle) {
                btn.selected = NO;
                self.setNormalStyle(btn);
            }
        }
        
        if (self.setSelectedStyle) {
            btn.selected = YES;
            self.setSelectedStyle(btn);
        }
        
    } else {
        if (self.setNormalStyle) {
            btn.selected = NO;
            self.setNormalStyle(btn);
        }
    }
}

- (NSArray *)selectedButtons {
    
    NSMutableArray *btns = [NSMutableArray arrayWithCapacity:_btns.count];
    
    for (UIButton *btn in _btns) {
        if (btn.selected) {
            [btns addObject:btn];
        }
    }
    return btns;
}

- (NSInteger)selectedCount; {
    return [self selectedButtons].count;
}
@end
