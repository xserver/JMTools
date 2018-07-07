//
//  UIView+isaShake.m
//  JMCategory
//
//  Created by xserver on 2016/10/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "UIView+isaShake.h"

@implementation UIView (isaShake)

static NSString *_isaShakeStatusKey = @"isaShakeStatusKey";

- (BOOL)isaShakeStatus {
    return ([self.layer animationForKey:_isaShakeStatusKey] == nil)? NO : YES;
}

- (void)setIsaShakeStatus:(BOOL)isaShakeStatus {
    
    if (isaShakeStatus && ![self isaShakeStatus]){
        CGFloat rotation          = 0.02;
        CABasicAnimation *shake   = [CABasicAnimation animationWithKeyPath:@"transform"];
        shake.duration            = 0.15;
        shake.autoreverses        = YES;
        shake.repeatCount         = MAXFLOAT;
        shake.removedOnCompletion = NO;
        shake.fromValue           = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform,-rotation, 0.0 ,0.0 ,1.0)];
        shake.toValue             = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, rotation, 0.0 ,0.0 ,1.0)];
        
        [self.layer addAnimation:shake forKey:_isaShakeStatusKey];
    }
    
    if (! isaShakeStatus){
        [self.layer removeAnimationForKey:_isaShakeStatusKey];
    }
}

@end
