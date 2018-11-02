//
//  ViewController.m
//  KeyAnimation
//
//  Created by xserver on 2016/11/16.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMAnimationCtrl.h"

@interface JMAnimationCtrl ()
@property (nonatomic, strong) UIView *myview;
@end

@implementation JMAnimationCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myview = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 50, 50)];
    self.myview.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:self.myview];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test)]];

//    self.myview.alpha = 0;
//    self.myview.layer.opacity = 0;
}

- (void)test {
    
//    [self testBasicPositionAnimation];
    
//    [self testKeyframeAnimationValues];
    
    [self testKeyframeAnimationKeyframe];
    
//    [self testGroupAnimation];
}

#pragma mark - CABasicAnimation
- (void)testBasicPositionAnimation {
    
    CABasicAnimation *position0 = [CABasicAnimation animationWithKeyPath:@"position"];
    position0.duration = 1; // 持续时间
    position0.beginTime = 2 + CACurrentMediaTime();
//    position0.fromValue = [NSValue valueWithCGPoint:self.myview.layer.position];
    
    //  to VS by
//    position0.toValue = [NSValue valueWithCGPoint:CGPointMake(80, 80)];
    position0.byValue = [NSValue valueWithCGPoint:CGPointMake(80, 80)];
    
    //  or remove
//    position0.removedOnCompletion = NO;
//    position0.fillMode = kCAFillModeForwards;
    
    
    position0.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.myview.layer addAnimation:position0 forKey:nil];
}

#pragma mark - CAKeyframeAnimation
- (void)testKeyframeAnimationValues {
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    keyframe.duration = 0.4;
    keyframe.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    
    keyframe.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    keyframe.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [self.myview.layer addAnimation:keyframe forKey:nil];
}

- (void)testKeyframeAnimationKeyframe {
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframe.duration = 0.8;
    keyframe.removedOnCompletion = NO;
    keyframe.fillMode = kCAFillModeForwards;
    keyframe.calculationMode = kCAAnimationCubicPaced;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, _myview.layer.position.x, _myview.layer.position.y);
    CGPathAddLineToPoint(curvedPath, NULL, 100, 200);
    CGPathAddLineToPoint(curvedPath, NULL, 150, 50);
    CGPathAddLineToPoint(curvedPath, NULL, 200, 150);
    
    keyframe.path = curvedPath;
    CGPathRelease(curvedPath);
    
    keyframe.keyTimes = @[@0.0f, @0.2f, @0.4f, @1.0f];
    keyframe.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [self.myview.layer addAnimation:keyframe forKey:nil];
}

- (void)testBasicOpacityAniamtion {
    
    //    CABasicAnimation *opacityAniamtion = [CABasicAnimation animationWithKeyPath:@"opacity"];
    //    opacityAniamtion.fromValue = @0;
    //    opacityAniamtion.toValue = @1;
    //    opacityAniamtion.fillMode = kCAFillModeForwards;
    //    opacityAniamtion.removedOnCompletion = NO;
    //    opacityAniamtion.duration = 2;
    //    opacityAniamtion.beginTime = CACurrentMediaTime() + 2;
}

#pragma mark - CAAnimationGroup

/**
 group VS single
 
    G.duration >= S1.duration + S2.duration
    G.removedOnCompletion 总效果
    S.removedOnCompletion 单个效果
 
    autoreverses => duration * 2
 
 */
- (void)testGroupAnimation {
    
    CABasicAnimation *position0 = [CABasicAnimation animationWithKeyPath:@"position"];
    position0.beginTime = 0;
    position0.duration = 1;
    position0.byValue = [NSValue valueWithCGPoint:CGPointMake(80, 80)];
    position0.fillMode = kCAFillModeForwards;
    position0.removedOnCompletion = NO;
    
    
    CABasicAnimation *position1 = [CABasicAnimation animationWithKeyPath:@"position"];
    position1.beginTime = 2.0f;
    position1.duration = 1;
    position1.byValue = [NSValue valueWithCGPoint:CGPointMake(-180, -180)];
    position1.fillMode = kCAFillModeForwards;
    position1.removedOnCompletion = NO;
    
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.beginTime = 1;
    rotation.duration = 0.5;
//    rotation.autoreverses = YES; // 结束后执行逆动画
//    rotation.fromValue = [NSNumber numberWithFloat:0.0];
    rotation.toValue = [NSNumber numberWithFloat:-0.25 * M_PI]; //45度角，-逆 +顺 时针
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 5;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[position1, position0, rotation];
    [self.myview.layer addAnimation:group forKey:@"move-layer"];

}

#pragma mark - CATransition

/**
 [self transitionWithType:@"push" withSubtype:@"fromTop" forView:shareAlert];


 */
- (void)transitionWithType:(NSString *)type withSubtype:(NSString *)subtype forView:(UIView *)view {

    CATransition *animation = [CATransition animation];
    animation.duration = 0.2;
    animation.type = type;
    
    if (subtype != nil) {
        animation.subtype = subtype;
    }
    
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}

- (void)animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition) transition {
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}



@end


