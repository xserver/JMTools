//
//  JMBannerView.h
//  JMTools
//
//  Created by xserver on 15/4/13.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMBannerViewConfig;

@interface JMBannerView : UICollectionView

@property (nonatomic, strong, readonly, nonnull) UIPageControl *pageControl;
@property (nonatomic, assign) CGFloat nextItemInterval; //  default 2.0f

+ (instancetype)bannerWithSize:(CGSize)size config:(id<JMBannerViewConfig>)config;

- (void)setup;


- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

@end


@protocol JMBannerViewConfig <NSObject>

@required
- (NSInteger)bannerCount;
- (void)bannerView:(JMBannerView *)banner willDisplayCell:(UICollectionViewCell *)cell atIndex:(NSInteger)index;
- (void)bannerView:(JMBannerView *)banner didSelectItemAtIndex:(NSInteger)index;

@end
