//
//  JMExampleTransitionCtrl.h
//  JMTools
//
//  Created by xserver on 16/5/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMControllerTransitionPush.h"

@interface JMExampleTransitionCtrl : UIViewController

@property (nonatomic, strong) id pushTransition;
@property (nonatomic, strong) id popTransition;

@property (nonatomic, strong) id presentTransition;

@property (nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@end
