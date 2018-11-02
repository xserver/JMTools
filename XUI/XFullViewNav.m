//
//  XFullViewNav.m
//  JMXUI
//
//  Created by xserver on 13/3/13.
//  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
//

#import "XFullViewNav.h"

@interface XFullViewNav ()
@property (strong, nonatomic) UIScrollView *scroll;
@property (strong, nonatomic) UIView *fullView;

@property (assign) BOOL isFull;
@property (assign) BOOL isAnimation;
@end

@implementation XFullViewNav

+ (instancetype)makeObj {
    return [[XFullViewNav alloc] init];
}

- (void)dealloc {
    if (_scroll != nil) {
        [_scroll removeObserver:self forKeyPath:@"contentOffset" context:NULL];
    }
    _scroll = nil;
    _fullView = nil;
}

- (void)setScrollView:(UIScrollView *)scroll fullView:(UIView *)view {
    
    _fullView = view;
    if (_scroll != nil) {
        [_scroll removeObserver:self forKeyPath:@"contentOffset" context:NULL];
        _scroll = nil;
    }
    
    if (scroll != nil) {
        _scroll = scroll;
        [_scroll addObserver:self forKeyPath:@"contentOffset"
                     options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
    }
}

- (void)setFull:(BOOL)on {
    
    if (on) {
        [self fullAnimation];
    }else{
        [self unfullAnimation];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        if (_scroll.contentOffset.y < 1) {
            //  上拉
//            NSLog(@"A");
            
            if (_fullView.frame.origin.y < 0) {
                [self unfullAnimation];
            }
            return;
        }
        if ( (_scroll.contentOffset.y + _scroll.frame.size.height) > ( _scroll.contentSize.height - 8)) {
            //  下拉
//            NSLog(@"B");
            
            if (_fullView.frame.origin.y > -1) {
                [self fullAnimation];
            }
            return;
        }
        
        CGPoint newPoint = [change [NSKeyValueChangeNewKey] CGPointValue];
        CGPoint oldPoint = [change [NSKeyValueChangeOldKey] CGPointValue];
        CGFloat deltaY = newPoint.y - oldPoint.y;
        
//        NSLog(@"%f  %@", deltaY, NSStringFromCGRect(_fullView.frame));
        if (deltaY < 0 && _fullView.frame.origin.y < 0 && _isAnimation == NO) {         //  && _isFull == YES
//            NSLog(@"D");
            [self unfullAnimation];
            return;
        }
        
        if (_scroll.decelerating && _fullView.frame.origin.y < 0) { // && _isFull
//            NSLog(@"E");
            return;
        }
        
        if (deltaY > 0 && _fullView.frame.origin.y > -1 && _isAnimation == NO) { //_isFull == NO &&
//            NSLog(@"F");
            [self fullAnimation];
            return;
        }
    }
}

- (void)fullAnimation {
    
    if (_isAnimation) {
        return;
    }
    
    _isAnimation = YES;
//    _isFull = YES; || _isFull
    
    [UIView animateWithDuration:0.25 animations:^{
        //        _scroll.frame = self.frameFull;
        _fullView.frame = self.frameFull;

    } completion:^(BOOL finished){
        
        _isAnimation = NO;
    }];
}

- (void)unfullAnimation {
    
    if (_isAnimation) {
        return;
    }

    _isAnimation = YES;
//    _isFull = NO; || _isFull == NO
    
    [UIView animateWithDuration:0.25 animations:^{

        //        _scroll.frame = self.frame;
        _fullView.frame = self.frame;
    } completion:^(BOOL finished){
        
        _isAnimation = NO;
    }];
}

@end
