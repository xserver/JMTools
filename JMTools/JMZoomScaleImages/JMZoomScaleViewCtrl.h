//
//  JMZoomScaleViewCtrl.h
//  Printer
//
//  Created by xserver on 15/7/25.
//  Copyright (c) 2015年 爱聚印. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMZoomScaleViewCtrl : UIViewController
@property (nonatomic, weak) id delegate;

- (void)scrollWithIndex:(NSInteger)index;

@end
