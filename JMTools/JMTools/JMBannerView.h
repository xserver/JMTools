//
//  JMBannerView.h
//  JMTools
//
//  Created by xserver on 15/4/13.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMBannerViewDelegate;

@interface JMBannerView : UIView

@property (nonatomic, strong, readonly, nonnull) UIPageControl *pageControl;    //  custom colors
@property (nonatomic, strong, readonly, nonnull) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat nextItemInterval; //  default 2.0f

@property (nonatomic, weak) id<JMBannerViewDelegate> delegate;

- (nonnull instancetype)initWithSize:(CGSize)size;

- (void)start;

- (void)registerClass:(nonnull Class)cellClass forCellWithReuseIdentifier:(nonnull NSString *)identifier;
- (void)registerNib:(nonnull UINib *)nib forCellWithReuseIdentifier:(nonnull NSString *)identifier;

@end


@protocol JMBannerViewDelegate <NSObject>

@required
- (NSInteger)bannerCount;
- (void)bannerView:(nonnull JMBannerView *)banner willDisplayCell:(nonnull UICollectionViewCell *)cell atIndex:(NSInteger)index;
- (void)bannerView:(nonnull JMBannerView *)banner didSelectItemAtIndex:(NSInteger)index;

@end


@interface JMBannerCell : UICollectionViewCell

@property (nonatomic, strong, nonnull) UIImageView *imageView;

@end