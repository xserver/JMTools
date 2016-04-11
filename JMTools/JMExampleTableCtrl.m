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
    
    
    self.list = @[@"Banner",
                  @"JMChooseImageHelper",
                  @"MCAlertCtrl",
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = self.list[indexPath.row];
    
    if ([title isEqualToString:@"Banner"]) {
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
    else if ([@"MCAlertCtrl" isEqualToString:title]) {
        
        UIAlertController *alert = MCAlertCtrl(@"title", @"message", ^(UIAlertAction *action) {
            
        });
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}


@end
