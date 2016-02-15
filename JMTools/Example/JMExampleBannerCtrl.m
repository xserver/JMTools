//
//  JMExampleBannerCtrl.m
//  JMTools
//
//  Created by jim on 16/1/27.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMExampleBannerCtrl.h"
#import "JMBannerView.h"
#import <Masonry.h>

@interface JMExampleBannerCtrl () <JMBannerViewDelegate>
@property (nonatomic, strong) JMBannerView *banner;
@property (nonatomic, strong) NSArray *images;
@end

@implementation JMExampleBannerCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.images = @[[UIImage imageNamed:@"A"],[UIImage imageNamed:@"B"],[UIImage imageNamed:@"C"]];

    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    CGSize size = CGSizeMake(bounds.size.width, bounds.size.width*0.5);
    
    _banner = [[JMBannerView alloc] initWithSize:size];
    [_banner registerClass:[JMBannerCell class] forCellWithReuseIdentifier:@"bannerCellID"];
    [self.view addSubview:_banner];
    
    [_banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(self.view.mas_width).multipliedBy(0.5);
    }];
    
    [_banner start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JMBannerViewDelegate
- (NSInteger)bannerCount {
    return self.images.count;
}

- (void)bannerView:(JMBannerView *)banner willDisplayCell:(nonnull UICollectionViewCell *)acell atIndex:(NSInteger)index {

    JMBannerCell *cell = (JMBannerCell *)acell;
    cell.imageView.image = self.images[index];
}

- (void)bannerView:(JMBannerView *)banner didSelectItemAtIndex:(NSInteger)index {
    
}
@end
