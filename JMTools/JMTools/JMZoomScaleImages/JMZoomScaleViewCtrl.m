//
//  JMZoomScaleViewCtrl.m
//  Printer
//
//  Created by xserver on 15/7/25.
//  Copyright (c) 2015年 爱聚印. All rights reserved.
//

#import "JMZoomScaleViewCtrl.h"
#import "JMZoomScaleView.h"

@interface JMZoomScaleViewCtrl ()
@property (nonatomic, strong) JMZoomScaleView *zoomView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act;

@end

@implementation JMZoomScaleViewCtrl

- (void)viewDidLoad {
    self.act.hidden = YES;
    [super viewDidLoad];
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self.view addSubview:self.zoomView];
    [self.view sendSubviewToBack:self.zoomView];
    
    self.zoomView.delegate = self.delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (JMZoomScaleView *)zoomView {
    if (_zoomView == nil) {
        _zoomView = [[JMZoomScaleView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    }
    return _zoomView;
}

- (IBAction)closeAction:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)scrollWithIndex:(NSInteger)index {
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:index inSection:0];
    
    [self.zoomView.collection scrollToItemAtIndexPath:ip atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

@end
