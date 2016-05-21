//
//  JMExampleTableCtrl.m
//  JMTools
//
//  Created by jim on 16/1/27.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMExampleTableCtrl.h"
#import "JMExampleBannerCtrl.h"
#import "JMChooseImageHelper.h"
#import "JMUISugar.h"
#import "JMMaskView.h"
#import "JMExampleTransitionCtrl.h"
#import "JMCtbMoveToPoint.h"

@interface JMExampleTableCtrl ()
@property (nonatomic, strong) NSArray *list;
@end

@implementation JMExampleTableCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.list = @[@"Present Transition",
                  @"Push Transition",
                  @"Banner",
                  @"JMChooseImageHelper",
                  @"QMAlertCtrl",
                  @"JMMaskView",
                  ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JMExampleRootCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.list[indexPath.row];
    
    return cell;
}

- (UIImageView *)screenshotWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [[UIImageView alloc] initWithImage:screenshot];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = self.list[indexPath.row];
    if (NO) {
    }
    else if ([title isEqualToString:@"Present Transition"]) {
        
        
//        [cell.imageView snapshotViewAfterScreenUpdates:NO];
        
        JMExampleTransitionCtrl *ctrl = [[JMExampleTransitionCtrl alloc] init];
        ctrl.image = [UIImage imageNamed:@"A"];
        
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"A"]];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        iv.frame = CGRectMake(100, 100, 100, 100);
        
        
        JMCtbMoveToPoint *ctb = [[JMCtbMoveToPoint alloc] init];
        ctb.view = iv;
        ctb.center = CGPointMake(317/2, 600/2);
        ctrl.presentTransition = ctb;
        
        
        ctrl.transitioningDelegate = ctrl;
        [self presentViewController:ctrl animated:YES completion:nil];
    }
    else if ([title isEqualToString:@"Push Transition"]) {
        
        JMExampleTransitionCtrl *ctrl = [[JMExampleTransitionCtrl alloc] init];
        ctrl.image = [UIImage imageNamed:@"A"];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"A"]];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        iv.frame = CGRectMake(100, 100, 100, 100);
        
        JMControllerTransitionPush *ctb = [[JMControllerTransitionPush alloc] init];
        ctb.zoomView = iv;
        ctrl.pushTransition = ctb;
        
        
        self.navigationController.delegate = ctrl;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:ctrl animated:YES];
        });
    }
    else if ([title isEqualToString:@"Banner"]) {
        [self.navigationController pushViewController:[[JMExampleBannerCtrl alloc] init] animated:YES];
    }
    else if ([title isEqualToString:@"JMChooseImageHelper"]) {
        
        [JMChooseImageHelper shared].resultImage = ^(JMChooseImageHelper *helper, NSDictionary *info) {
            
            NSLog(@"%@", helper.originalImage);
            
            NSLog(@"%@", helper.imagePicker);
            
            [helper close];
        };
        [[JMChooseImageHelper shared] show];
    }
    else if ([@"QMAlertCtrl" isEqualToString:title]) {
        
        [QMAlertCtrl(@"title", @"message",
                    @"AA", ^(UIAlertAction *xx){NSLog(@"xxxx");},
                    @"AA", nil) showForController:nil];
        
//        [self presentViewController:QMAlertCtrl(@"title", @"message",
//                                                @"AA", ^(UIAlertAction *xx){
//                                                    NSLog(@"xxxx");},
//                                                
//                                                @"AA", nil)
//                           animated:YES
//                         completion:nil];
        ;

    }
    
    else if ([@"JMMaskView" isEqualToString:title]) {
        JMMaskView *mask = [[JMMaskView alloc] init];
        [mask showInWindow];
        
        mask.appear = ^(JMMaskView *contentView){
        
        
        };
        
    }
}


@end
