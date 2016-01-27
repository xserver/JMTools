//
//  JMBannerView.m
//  JMTools
//
//  Created by xserver on 15/4/13.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMBannerView.h"
#import <Masonry.h>

@interface JMBannerView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (copy  , nonatomic) NSString *cellIdentifier;

@property (nonatomic, assign) NSInteger realCount;
@property (nonatomic, assign) NSInteger inventCount;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation JMBannerView

+ (instancetype)bannerWithSize:(CGSize)size delegate:(nonnull id<JMBannerViewDelegate>)delegate {
    
    JMBannerView *banner = [[JMBannerView alloc] initWithSize:size];
    banner.delegate = delegate;
    return banner;
}

- (id)initWithSize:(CGSize)size {
    if (self = [super init]) {
        
        self.layout = [JMBannerView layoutWithSize:size];
        
        _nextItemInterval = 2.0f;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTimer) name:UIApplicationWillEnterForegroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTimer) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        self.backgroundColor = [UIColor brownColor];
        
        [self addSubview:self.collectionView];
        [self addSubview:self.pageControl];
        
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(-2);
            make.height.equalTo(@16);
        }];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)dealloc {
    [self removeTimer];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)registerClass:(nonnull Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    self.cellIdentifier = identifier;
    [_collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

- (void)registerNib:(nonnull UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier {
    self.cellIdentifier = identifier;
    [_collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
}

- (void)start {
    
    if ([_delegate respondsToSelector:@selector(bannerCount)]) {
        
        NSInteger count = [_delegate bannerCount];
        if (count > 2) {
            _pageControl.numberOfPages = count;
            self.realCount = count;
            self.inventCount = count * 100;
            
            [self scrollToHalfLocation];
            [self addTimer];
        }
    }
}

#pragma mark - Get
- (UIPageControl *)pageControl {
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.pageIndicatorTintColor = [UIColor blackColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor blueColor];
        _collectionView.contentInset = UIEdgeInsetsZero;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
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
    NSInteger index = _collectionView.contentOffset.x / self.layout.itemSize.width + 1;
    
    if (index >= _inventCount) {
        return;
    }
    
    if (index == (_inventCount - _realCount) || index == _inventCount) {
        [self scrollToHalfLocation];
    }else{
        NSIndexPath *ip = [NSIndexPath indexPathForItem:index inSection:0];
        [_collectionView scrollToItemAtIndexPath:ip atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}

- (void)scrollToHalfLocation {
    
    NSInteger index = _inventCount * 0.5;
    NSIndexPath *ip = [NSIndexPath indexPathForItem:index inSection:0];
    [_collectionView scrollToItemAtIndexPath:ip atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
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

    NSInteger index = [self realIndexWithRow:indexPath.row];
    _pageControl.currentPage = index;
    
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    if ([_delegate respondsToSelector:@selector(bannerView:willDisplayCell:atIndex:)]) {
        [_delegate bannerView:self willDisplayCell:cell atIndex:index];
    }
    
    return cell;
}

#pragma mark == UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_delegate respondsToSelector:@selector(bannerView:didSelectItemAtIndex:)]) {
        [_delegate bannerView:self didSelectItemAtIndex:[self realIndexWithRow:indexPath.row]];
    }
}

@end



#pragma mark
@implementation JMBannerCell

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}


@end