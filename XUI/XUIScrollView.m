//
//  XUIScrollView.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XUIScrollView.h"


@interface XUIScrollView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation XUIScrollView

+ (instancetype)makeObjWithFrame:(CGRect)frame {
    
    return [[XUIScrollView alloc] initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame: self.bounds];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * 3,
                                             CGRectGetHeight(self.frame));
        
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

#pragma mark -
- (void)reloadData {
    
}

- (NSInteger)validIndexValue:(NSInteger)value {
    
    if(value == -1) {
        value = self.numberOfControllers - 1;
    }
    
    if(value == self.numberOfControllers) {
        value = 0;
    }
    return value;
}

- (NSInteger)numberOfControllers {
    return [self.delegate numberOfXUIScrollView:self];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

@end