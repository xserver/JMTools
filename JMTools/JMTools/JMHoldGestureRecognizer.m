//
//  JMHoldGestureRecognizer.m
//  JMTools
//
//  Created by xserver on 15/12/29.
//  Copyright © 2015年 pitaya. All rights reserved.
//

#import "JMHoldGestureRecognizer.h"

@interface JMHoldGestureRecognizer ()

@property (nonatomic, strong) NSTimer *pressTimer;

@end

@implementation JMHoldGestureRecognizer

- (id)init {
    if (self = [super init]) {
        _minimumPressDuration = 0;
    }
    return self;
}

- (id)initWithTarget:(id)target action:(SEL)action {
    if (self = [super initWithTarget:target action:action]) {
        _minimumPressDuration = 0;
    }
    return self;
}

- (void)longPressed:(NSTimer *)theTimer {
    
    if (theTimer == self.pressTimer) {
        self.state = UIGestureRecognizerStateBegan;
        
        [theTimer invalidate];
        self.pressTimer = nil;
    }
}

//- (void)reset {
//    [super reset];
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    if ([touches count] != 1 || [[touches anyObject] tapCount] > 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }

    self.state = UIGestureRecognizerStateBegan;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    if (self.state == UIGestureRecognizerStateFailed) {
        return;
    }
    
    self.state = UIGestureRecognizerStateChanged;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    self.state = UIGestureRecognizerStateEnded;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    self.state = UIGestureRecognizerStateFailed;
}


@end


//JMHoldGestureRecognizer *QFHold(id target, SEL action) {
//    return [[JMHoldGestureRecognizer alloc] initWithTarget:target action:action];
//}