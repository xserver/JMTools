//
//  XUIScrollView.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XUIScrollGrid.h"

@interface XUIScrollGrid () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *contents;

@property (nonatomic) CGFloat offsetRadio;
@property (nonatomic) NSInteger activeIndex;
@property (nonatomic) NSUInteger page;

@end

@implementation XUIScrollGrid

+ (instancetype)makeObjWithFrame:(CGRect)frame {

    return [[XUIScrollGrid alloc] initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        if (_contents) {
            self.contents = [[NSMutableArray alloc] init];
        }
        
        [self addSubview: self.scrollView];
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
    
    if ([self.delegate respondsToSelector:@selector(XUIScrollView:contentViewAtIndex:)] == NO) {
        return;
    }
    
    [[self.scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //  将 view 取除，放入队列
    for (int index = 0; index < 3; index ++) {
        NSInteger thisPage = [self validIndexValue: self.activeIndex - 1 + index];
        id obj = [self.delegate XUIScrollView:self contentViewAtIndex:thisPage];
        [self.contents replaceObjectAtIndex:index withObject:obj];
    }
    
    for (int i = 0; i < 3; i++) {
        
        UIView *view = [self.contents objectAtIndex:i];
        view.userInteractionEnabled = YES;
        view.frame = CGRectOffset(self.scrollView.frame, view.frame.size.width * i, 0);
        [self.scrollView addSubview: view];
    }
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width + self.scrollView.frame.size.width * self.offsetRadio, 0)];
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

- (void)setActiveIndex:(NSInteger)activeIndex{
    
    if (_activeIndex != activeIndex) {
        _activeIndex = activeIndex;
        [self reloadData];
    }
}

- (NSInteger)numberOfControllers {
    if ([self.delegate respondsToSelector:@selector(numberOfXUIScrollView:)]) {
        return [self.delegate numberOfXUIScrollView:self];
    }
    
    return 0;
}

- (void)setOffsetRadio:(CGFloat)offsetRadio {
    NSLog(@"%f", offsetRadio);
    
    if (_offsetRadio != offsetRadio) {
        _offsetRadio = offsetRadio;
        
        //  重置！
        CGFloat offsetX = (1 + offsetRadio) * self.scrollView.frame.size.width;
        [self.scrollView setContentOffset:CGPointMake(offsetX, 0)];
        
        if (offsetRadio > 0.5) {
            _offsetRadio = offsetRadio - 1;
            self.activeIndex = [self validIndexValue:self.activeIndex + 1];
        }
        
        if (offsetRadio < -0.5) {
            _offsetRadio = offsetRadio + 1;
            self.activeIndex = [self validIndexValue:self.activeIndex - 1];
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //  偏移值 除 宽度 再 减1 =》 [0.1, x.x];
    //  偏移的比例
    //    [0, 0]
    NSLog(@"%f  -  %f", scrollView.contentOffset.x, CGRectGetWidth(scrollView.frame));
    self.offsetRadio = scrollView.contentOffset.x/CGRectGetWidth(scrollView.frame) - 1;
}

@end
