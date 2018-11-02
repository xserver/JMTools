//
//  XFullViewOper.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XFullViewOper.h"
#import "XUIConfigure.h"

@interface XFullViewOper ()
@property (strong, nonatomic) UIScrollView *scroll;
@property (strong, nonatomic) UIView *fullView;
@property (strong, nonatomic) UIView *nav;
@property (strong, nonatomic) UIView *toolbar;

@property (assign) BOOL isAnimation;
@end

@implementation XFullViewOper

+ (instancetype)makeObj {
    return [[XFullViewOper alloc] init];
}

- (void)dealloc {
    if (_scroll != nil) {
        [_scroll removeObserver:self forKeyPath:@"contentOffset" context:NULL];
    }
    _scroll = nil;
    _fullView = nil;
    _nav = nil;
    _toolbar = nil;
}

- (void)setScrollView:(UIScrollView *)scroll toolbar:(UIView *)toolbar {
    
    if (_scroll != nil) {
        
        [_scroll removeObserver:self forKeyPath:@"contentOffset" context:NULL];
        
        //        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
        _scroll = nil;
    }
    
    if (scroll != nil) {
        _scroll = scroll;
        
        [_scroll addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
        
        //        [[NSNotificationCenter defaultCenter] addObserver:self
        //                                                 selector:@selector(onWillEnterForegroundNotification:)
        //                                                     name:UIApplicationWillEnterForegroundNotification
        //                                                   object:nil];
    }
    _toolbar = toolbar;
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        if (_scroll.contentOffset.y < 1) {
            //  上拉
//            NSLog(@"A");
            return;
        }
        if ( (_scroll.contentOffset.y + _scroll.frame.size.height) > ( _scroll.contentSize.height - 8)) {
            //  下拉
//            NSLog(@"B");
            return;
        }

        if (_toolbar.frame.origin.y < XHigth - 50.0) {
            //  隐藏中
//            NSLog(@"C");
            return;
        }
        
        //        NSLog(@"%@", NSStringFromCGRect(_scroll.frame));
        //        NSLog(@"%@", NSStringFromCGRect(_scroll.bounds));
        CGPoint newPoint = [change [NSKeyValueChangeNewKey] CGPointValue];
        CGPoint oldPoint = [change [NSKeyValueChangeOldKey] CGPointValue];
        CGFloat deltaY = newPoint.y - oldPoint.y;
        
        
        if (deltaY < 0 && _isFull == YES && _isAnimation == NO) {
//            NSLog(@"D");
            [self unfullAnimation];
            return;
        }
        
        //  惯性滑动时不处理
        if (_scroll.decelerating && _isFull) {
//            NSLog(@"E");
            return;
        }
        
        if (deltaY > 0 && _isFull == NO && _isAnimation == NO) {
//            NSLog(@"F");
            [self fullAnimation];
            return;
        }
    }
}

- (void)fullAnimation {
    if (_isAnimation || _isFull) {
        return;
    }
    
    _isAnimation = YES;
    _isFull = YES;
    
    [UIView animateWithDuration:0.25 animations:^{
//        [_toolbar setOriginY:_toolbar.frame.origin.y + 44];
    [_toolbar setFrame:CGRectMake(0, XHigth, XWidth, 44)];
    } completion:^(BOOL finished){
        
        _isAnimation = NO;
    }];
}

- (void)unfullAnimation {
    
    if (_isAnimation || _isFull == NO) {
        return;
    }
    
    _isAnimation = YES;
    _isFull = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
//        [_toolbar setOriginY:_toolbar.frame.origin.y - 44];
        [_toolbar setFrame:CGRectMake(0, XHigth - 44, XWidth, 44)];
    } completion:^(BOOL finished){
        
        _isAnimation = NO;
    }];
}

@end
