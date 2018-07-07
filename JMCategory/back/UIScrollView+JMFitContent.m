//
//  UIScrollView+JMFitContent.m
//  JMCategory
//
//  Created by jim on 15/10/28.
//  Copyright © 2015年 pitaya. All rights reserved.
//

#import "UIScrollView+JMFitContent.h"

@implementation UIScrollView (JMFitContent)

- (void)autoFitContentWithController:(UIViewController *)controller {
    
    if (self.contentSize.height + self.contentInset.top + self.contentInset.bottom > self.frame.size.height) {
        //  googd
        return;
    } else {
        //  interfere
        CGFloat height = 0;
        
        if ( ! controller.hidesBottomBarWhenPushed) {
            height += controller.tabBarController.tabBar.frame.size.height;
        }
        
        if ( ! controller.navigationController.navigationBarHidden) {
            
            height += controller.navigationController.navigationBar.frame.size.height +
            [[UIApplication sharedApplication] statusBarFrame].size.height;
        }
        
        self.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height - height + 1);
    }
}
@end
