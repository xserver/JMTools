//
//  JMZoomScaleView.m
//  Image
//
//  Created by xserver on 15/7/25.
//  Copyright (c) 2015年 pitaya. All rights reserved.
//

#import "JMZoomScaleCell.h"

@implementation JMZoomScaleCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        CGRect bounds = [[UIScreen mainScreen] applicationFrame];
        _scroll = [[UIScrollView alloc] initWithFrame:bounds];
        _scroll.maximumZoomScale = 2;
        _scroll.delegate = self;
        [self addSubview:_scroll];
        
//        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction)];
//        [self addGestureRecognizer:tap1];

        _saveActivity.hidden = YES;
        _loadActivity.hidden = YES;
        
        _imageView = [[UIImageView alloc] initWithFrame:bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_scroll addSubview:_imageView];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"viewShowcase dealloc");
}

- (UIView *)showView {
    
    return self.imageView;
}

- (void)closeAction {
    _scroll.zoomScale = 1;
}


- (void)setImageURL:(NSURL *)url {
    
//    [self startActivity];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
//    
//    WeakSelf;
//    [_imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image){
//        [weakself setImage:image];
//        [weakself stopActivity];
//    } failure:nil];
}

- (void)startActivity {
    _loadActivity.hidden = NO;
    [_loadActivity startAnimating];
}
- (void)stopActivity {
    _loadActivity.hidden = YES;
    [_loadActivity stopAnimating];
}


//  这个可以移到点击的中心
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    zoomRect.size.height = self.frame.size.height / scale;
    zoomRect.size.width  = self.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}

- (void)doubleTap:(UITapGestureRecognizer *)tap {
    
    //    float newScale = _scroll.zoomScale * 1.5;
    //    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[tap locationInView:tap.view]];
    //    [_scroll zoomToRect:zoomRect animated:YES];
    
    if (_scroll.zoomScale < 1.1) {
        _scroll.zoomScale = 2;
    }else{
        _scroll.zoomScale = 1;
    }
}

- (void)resetZoomScale {
    _scroll.zoomScale = 1;
}

#pragma mark - scroll delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {

    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ?
        (scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ?
        (scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
    
    CGPoint pt = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
    
    _imageView.center = pt;
}


@end
