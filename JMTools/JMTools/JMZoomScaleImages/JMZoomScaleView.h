//
//  JMZoomScaleView.h
//  Image
//
//  Created by xserver on 15/7/25.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMZoomScaleViewDelegate;

@interface JMZoomScaleView : UIView

@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@protocol JMZoomScaleViewDelegate <NSObject>

- (NSInteger)JMZoomScaleViewImageCount;

- (void)JMZoomScaleView:(JMZoomScaleView *)zoomView
              imageView:(UIImageView *)imageView
            atIndexPath:(NSIndexPath *)indexPath;

- (void)JMZoomScaleView:(JMZoomScaleView *)zoomView saveImage:(UIImageView *)imageView;

@end