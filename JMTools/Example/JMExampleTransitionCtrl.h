//
//  JMExampleTransitionCtrl.h
//  JMTools
//
//  Created by Dragon on 16/5/20.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMControllerTransitionPush.h"

@interface JMExampleTransitionCtrl : UIViewController

@property (nonatomic, strong) JMControllerTransitionPush *pushTransition;
@property (nonatomic, strong) id popTransition;
@property (nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@end
