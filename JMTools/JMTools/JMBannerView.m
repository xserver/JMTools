//
//  JMBannerView.m
//  JMTools
//
//  Created by xserver on 15/4/13.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMBannerView.h"

@interface JMBannerView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) id config;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (copy  , nonatomic) NSString *cellIdentifier;

@property (nonatomic, assign) NSInteger realCount;
@property (nonatomic, assign) NSInteger inventCount;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation JMBannerView

+ (instancetype)bannerWithSize:(CGSize)size config:(id<JMBannerViewConfig>)config {
    
    JMBannerView *banner = [[JMBannerView alloc] initWithFrame:CGRectZero
                                          collectionViewLayout:[JMBannerView layoutWithSize:size]];
    banner.pagingEnabled = YES;
    banner.showsHorizontalScrollIndicator = NO;
    banner.showsVerticalScrollIndicator = NO;
    banner.bounces = NO;
    
    banner.dataSource = banner;
    banner.delegate = banner;
    banner.config = config;
    return banner;
}

- (void)setup {
    
    if ([_config respondsToSelector:@selector(bannerCount)]) {
        
        NSInteger count = [_config bannerCount];
        self.pageControl.numberOfPages = count;
        self.realCount = count;
        self.inventCount = count * 100;
    }

    [self scrollToHalfLocation];
    [self addTimer];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _nextItemInterval = 2.0f;
        [self addSubview:self.pageControl];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTimer) name:UIApplicationWillEnterForegroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTimer) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [self removeTimer];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    self.cellIdentifier = identifier;
    [super registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier {
    self.cellIdentifier = identifier;
    [super registerNib:nib forCellWithReuseIdentifier:identifier];
}

#pragma mark - Get
- (UIPageControl *)pageControl {
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 20, CGRectGetWidth(self.frame), 20)];
        
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.pageIndicatorTintColor = [UIColor blackColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}

+ (UICollectionViewFlowLayout *)layoutWithSize:(CGSize)size {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    return layout;
}

- (void)setNextItemInterval:(CGFloat)nextItemInterval {
    if (nextItemInterval < 0.1f) {
        return;
    }
    _nextItemInterval = nextItemInterval;
}

#pragma mark - Logic
- (NSInteger)realIndexWithRow:(NSInteger)row {
    NSInteger index = row % _realCount;
    return index;
}

- (void)scrollNextPage {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    NSInteger index = self.contentOffset.x / layout.itemSize.width + 1;
    
    if (index >= _inventCount) {
        return;
    }
    
    if (index == (_inventCount - _realCount) || index == _inventCount) {
        [self scrollToHalfLocation];
    }else{
        NSIndexPath *ip = [NSIndexPath indexPathForItem:index inSection:0];
        [self scrollToItemAtIndexPath:ip atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}

- (void)scrollToHalfLocation {
    
    NSInteger index = _inventCount * 0.5;
    NSIndexPath *ip = [NSIndexPath indexPathForItem:index inSection:0];
    [self scrollToItemAtIndexPath:ip atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

#pragma mark - Timer
- (void)addTimer {
    
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.nextItemInterval target:self selector:@selector(scrollNextPage) userInfo:nil repeats:YES];
    }
}

- (void)removeTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark == UIScrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}

#pragma mark == UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _inventCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    if ([_config respondsToSelector:@selector(bannerView:willDisplayCell:atIndex:)]) {
        
        NSInteger index = [self realIndexWithRow:indexPath.row];
        self.pageControl.currentPage = index;
        
        [_config bannerView:self willDisplayCell:cell atIndex:index];
    }
    
    return cell;
}

#pragma mark == UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_config respondsToSelector:@selector(bannerView:didSelectItemAtIndex:)]) {
        [_config bannerView:self didSelectItemAtIndex:[self realIndexWithRow:indexPath.row]];
    }
}

@end
