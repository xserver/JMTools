//
//  JMExampleTableCtrl.m
//  JMTools
//
//  Created by jim on 16/1/27.
//  Copyright © 2016年 pitaya. All rights reserved.
//

#import "JMExampleTableCtrl.h"
#import "JMExampleBannerCtrl.h"

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
    
    
    self.list = @[@"Banner"];
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
    
    
    [self.navigationController pushViewController:[[JMExampleBannerCtrl alloc] init] animated:YES];
    
}
@end
