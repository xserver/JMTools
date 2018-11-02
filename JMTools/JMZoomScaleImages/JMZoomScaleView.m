//
//  JMZoomScaleView.m
//  Image
//
//  Created by xserver on 15/7/25.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMZoomScaleView.h"
#import "JMZoomScaleCell.h"

@interface JMZoomScaleView () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation JMZoomScaleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        CGRect bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:[self createCollectionWithBounds:bounds]];
    }
    return self;
}

- (UIColor *)randomColor {
    
    CGFloat red   = arc4random() % 256 / 256.0;
    CGFloat blue  = arc4random() % 256 / 256.0;
    CGFloat green = arc4random() % 256 / 256.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

#pragma mark - UICollectionView
static NSString *identifier = @"JMZoomScaleCell";
- (UICollectionView *)createCollectionWithBounds:(CGRect)bounds {
    if (_collection == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = bounds.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout = layout;
        
        UICollectionView *collec = [[UICollectionView alloc] initWithFrame:bounds collectionViewLayout:layout];
        collec.backgroundColor = [UIColor blackColor];
        collec.pagingEnabled = YES;
        collec.showsHorizontalScrollIndicator = NO;
        collec.showsVerticalScrollIndicator = NO;
        collec.dataSource = self;
        collec.delegate = self;
        
        _collection = collec;
        [_collection registerClass:[JMZoomScaleCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collection;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.delegate JMZoomScaleViewImageCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JMZoomScaleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                                      forIndexPath:indexPath];
    [cell resetZoomScale];
    [self.delegate JMZoomScaleView:self imageView:cell.imageView atIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
