//
//  JMCtbMoveToPoint.h
//  JMTools
//
//  Created by Dragon on 16/5/21.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMControllerTransitionBase.h"

@interface JMCtbMoveToPoint : JMControllerTransitionBase

@property (nonatomic, strong) UIView *view;

@property (nonatomic, assign) CGPoint center;

@end
