//
//  JMZoomScaleView.h
//  Image
//
//  Created by xserver on 15/7/25.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMZoomScaleCell : UICollectionViewCell <UIScrollViewDelegate>

@property (weak, nonatomic  ) UIActivityIndicatorView *saveActivity;
@property (weak, nonatomic  ) UIActivityIndicatorView *loadActivity;
@property (strong, nonatomic) UIScrollView            *scroll;
@property (strong, nonatomic) UIImageView             *imageView;

- (void)resetZoomScale;

@end
