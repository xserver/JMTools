////
////  XUISearchBar.m
////  JMXUI
////
////  Created by xserver on 13/3/13.
////  Copyright (c) 2013年 https://github.com/xserver. All rights reserved.
////
//
//#import "XUISearchBar.h"
//
//@interface XUISearchBar () <UITableViewDelegate, UITableViewDataSource>
//
//@property (strong, nonatomic) UIView *inputView;
//@property (strong, nonatomic) UITextField *searchField;
//@property (strong, nonatomic) UIButton *searchCancelButton;
//@property (strong, nonatomic) XUIeView *fieldIJMXUIe;
//
//@property (strong, nonatomic) UIView *searchView;
//@property (strong, nonatomic) XUIeView *searchIJMXUIe;
//@property (strong, nonatomic) UILabel *searchLabel;
//@property (strong, nonatomic) UITapGestureRecognizer *tap;
//@property (strong, nonatomic) UIButton *goButton;
//@property (strong, nonatomic) UIButton *clearButton;
//
//@property (strong, nonatomic) UITableView *tab;
//@property (strong, nonatomic) NSMutableArray *selectResult;
//@property (strong, nonatomic) NSArray *searchResult;
//@property (strong, nonatomic) NSArray *list;
//@end
//
//@implementation XUISearchBar
//
//- (void)dealloc {
//    [_request clearDelegatesAndCancel];
//}
//
//+ (instancetype)makeObj {
//    id obj = [[XUISearchBar alloc] initWithFrame:CGRectMake(0, 0, XWidth, 44)];
//    return obj;
//}
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//        [self addSubview:self.inputView];
//        self.inputView.alpha = 0;
//        [self addSubview:self.searchView];
//        
//        _selectResult = [NSMutableArray arrayWithCapacity:12];
//    }
//    return self;
//}
//
//#pragma mark - action
//- (void)showSearchModel {
//    
//    if (_searching == YES) {
//        return;
//    }
//    _searching = YES;
//    
//    self.tab.alpha = 0;
//    [self.superview addSubview:self.tab];
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        _searchView.alpha = 0;
//        _inputView.alpha = 1;
//        _tab.alpha = 1;
//    } completion:^(BOOL finished){
//        
//        if (finished) {
//            _searchField.text = @"";
//            [_searchField becomeFirstResponder];
//        }
//    }];
//}
//
//- (void)searchCancelAction {
//    
//    [_request clearDelegatesAndCancel];
//    [self hideSearchModel];
//}
//
//- (void)hideSearchModel {
//    if (_searching == NO) {
//        return;
//    }
//    _searching = NO;
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        //        _searchField.text = @"";
//        //        _searchField.placeholder = @"搜索主题";
//        //        _searchResult = nil;
//        _searchView.alpha = 1;
//        _inputView.alpha = 0;
//                _tab.alpha = 0;
//    } completion:^(BOOL finished){
//        
//        if (finished) {
//            [_searchField resignFirstResponder];
//        }
//        [self.tab removeFromSuperview];
//    }];
//}
//
//#pragma mark - ASI HTTP Delegate
//- (void)requestFinished:(ASIHTTPRequest *)request {
//
//    _request = nil;
//    
//    NSDictionary *response = [NetRequest handleBusinessRequest:request];
//    if (response == nil) {
//        return;
//    }
//    
//    NSString *key = [request.userInfo objectForKey:@"key"];
//    if ([@"search" isEqualToString:key]) {
//        NSArray *list = [[response objectForKey:@"data"] objectForKey:@"topics"];
//        
//        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:list.count];
//        for (NSString *topic in list) {
//            TopicObj *tt = [TopicObj makeTickObj:NO topic:topic];
//            [temp addObject:tt];
//        }
//        _searchResult = temp;
//        [_tab reloadData];
//    }
//}
//
//- (void)requestFailed:(ASIHTTPRequest *)request {
//    NSLog(@"RegisterCtrl send request NO");
//    NSError *error = [request error];
//    NSLog(@"%@", error);
//    
//    return;
//}
//
//#pragma mark - get
//- (UIView *)inputView {
//    if (_inputView == nil) {
//        _inputView = [UIView.alloc initWithFrame:self.bounds];
//        [_inputView addSubview:self.searchCancelButton];
//        [_inputView addSubview:self.searchField];
//    }
//    return _inputView;
//}
//
//- (UIView *)searchView {
//    if (_searchView == nil) {
//        _searchView = [UIView.alloc initWithFrame:self.bounds];
//        [_searchView addSubview:self.searchLabel];
//        [_searchView addSubview:self.goButton];
//    }
//    return _searchView;
//}
//- (UIButton *)searchCancelButton {
//    
//    if (_searchCancelButton == nil) {
//        _searchCancelButton = [UIButton buttonWithType:0];
//        _searchCancelButton.frame = CGRectMake(self.frame.size.width - 54, 0, 44, 44);
//        [_searchCancelButton setIJMXUIe:[XUIe iJMXUIeNamed:@"icon_delete_quicksearch"] forState:0];
//        [_searchCancelButton addTarget:self action:@selector(searchCancelAction) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _searchCancelButton;
//}
//- (UIButton *)clearButton {
//    if (_clearButton == nil) {
//        _clearButton = [UIButton buttonWithType:0];
//        _clearButton.hidden = YES;
//        [_clearButton addTarget:self action:@selector(clearSearchbar) forControlEvents:UIControlEventTouchUpInside];
//        _clearButton.frame = CGRectMake(192, 0, 40, 40);
//        [_clearButton setIJMXUIe:[XUIe iJMXUIeNamed:@"right_delete"] forState:0];
//    }
//    return _clearButton;
//}
//
//- (UILabel *)searchLabel {
//    
//    if (_searchLabel == nil) {
//        _searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(4, 4, self.frame.size.width - 70, 40)];
//        _searchLabel.userInteractionEnabled = YES;
//        _searchLabel.textColor = [UIColor red:122 green:122 blue:122];
//        _searchLabel.backgroundColor = [UIColor yellowColor];
//        _searchLabel.font = [UIFont boldSystemFontOfSize:16];
//        _searchLabel.numberOfLines = 2;
//        _searchLabel.adjustsFontSizeToFitWidth = YES;
//        //        _searchLabel.minimumFontSize = 12;
//        
//        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showSearchModel)];
//        [_searchLabel addGestureRecognizer:_tap];
//        
//        _searchIJMXUIe = [[XUIeView alloc] initWithIJMXUIe:[XUIe iJMXUIeNamed:@"nav_search_green"]];
//        _searchIJMXUIe.frame = CGRectMake(4, 4, 30, 30);
//        [_searchLabel addSubview:_searchIJMXUIe];
//    }
//    
//    return _searchLabel;
//}
//
//- (UIButton *)goButton {
//    
//    if (_goButton == nil) {
//        _goButton = [UIButton buttonWithType:0];
//        _goButton.frame = CGRectMake(self.frame.size.width - 44 - 10, 0, 44, 44);
//        [_goButton setIJMXUIe:[XUIe iJMXUIeNamed:@"right_go"] forState:UIControlStateNormal];
//        [_goButton addTarget:self action:@selector(acGo) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _goButton;
//}
//
//- (UITextField *)searchField {
//    
//    if (_searchField == nil) {
//        CGRect frame = CGRectMake(6, 2, self.frame.size.width - 70, 40);
//        _searchField = [[UITextField alloc] initWithFrame:frame];
//        _searchField.backgroundColor = [UIColor whiteColor];
//        _searchField.font = [AppFont searchField];
//        //        _searchField.delegate = self;
//        //        _searchField.textColor = _mainColor;
//        //        _searchField.placeholder = @"搜索主题";
//        _searchField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//        [_searchField setValue:[UIColor red:214 green:214 blue:214]
//                    forKeyPath:@"_placeholderLabel.textColor"];
//        [_searchField addTarget:self action:@selector(searchTextChange:) forControlEvents:UIControlEventEditingChanged];
//        
////        _fieldIJMXUIe = [XUIeView.alloc initWithFrame:frame];
////        _fieldIJMXUIe.backgroundColor = [UIColor brownColor];
//        
//        _searchField.background = [XUIe iJMXUIeNamed:@"right_go"];
//    }
//    
//    return _searchField;
//}
//
//- (void)searchTextChange:(UITextField *)textField {
//    
//    NSString *searchText = textField.text;
//    if ([searchText length] == 0){
//        return;
//    }
//    
////    if ([self.delegate respondsToSelector:@selector(searchTextChange:)]) {
////        [self.delegate searchTextChange:searchText];
////    }
//
//    if (_request != nil) {
//        [_request clearDelegatesAndCancel];
//        _request = nil;
//    }
//    
//    _request = [NetRequest searchTopic:self info:@{@"key":@"search"} data:searchText];
//}
//
//- (BOOL)selectResultAddString:(NSString *)topic {
//    
//    for (NSString *str in _selectResult) {
//        if ([str isEqualToString:topic]) {
//            return NO;
//        }
//    }
//    [_selectResult insertObject:topic atIndex:0];
//    return YES;
//}
//
//- (void)setSearchLabelText:(NSString *)text {
//    if ([text isEqualToString:@""]) {
//        _clearButton.hidden = YES;
//    }else{
//        _clearButton.hidden = NO;
//    }
//    _searchLabel.text = text;
//    _searchIJMXUIe.hidden = (text.length > 0) ? YES : NO;
//    
//}
//
//- (void)clearSearchbar {
//    [self setSearchLabelText:@""];
//    
//    for (NSArray *array in _list) {
//        for (TopicObj *obj in array) {
//            obj.tick = NO;
//        }
//    }
//    [_selectResult removeAllObjects];
//    [_tab reloadData];
//}
//
//- (void)reshowSearchLabel {
//    
//    //  没有了，清空
//    if (_selectResult.count == 0) {
//        [self setSearchLabelText:@""];
//        return;
//    }
//    
//    NSMutableString *str = [NSMutableString stringWithCapacity:256];
//    for (int i = _selectResult.count - 1; i >= 0; i--) {
//        [str appendFormat:@"%@ + ", [_selectResult objectAtIndex:i]];
//    }
//    
//    [self setSearchLabelText:str];
//}
//
//#pragma mark tab
//- (UITableView *)tab {
//    
//    if (_tab == nil) {
//        
//        _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.frame.size.width, XHigth-44)
//                                            style:UITableViewStylePlain];
//        _tab.delegate = self;
//        _tab.dataSource = self;
//        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tab.backgroundView = nil;
//        _tab.backgroundColor = [UIColor greenColor];
//        _tab.scrollsToTop = YES;
//        
//        UINib *nib = [UINib nibWithNibName:@"TopicCell" bundle:nil];
//        [_tab registerNib:nib forCellReuseIdentifier:@"TopicCell"];
//    }
//    return _tab;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    NSInteger row = indexPath.row;
//    
//    TopicCell *cell = [_tab dequeueReusableCellWithIdentifier:@"TopicCell"];
////    cell.contentView.backgroundColor = [UIColor randomColor];
//    cell.tickButton.hidden = YES;
//    cell.topicObj = [_searchResult objectAtIndex:row];
//    cell.topicLabel.textColor = [UIColor red:122 green:122 blue:122];
//    return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (_searching) {
//        
//        //  add to history
//        TopicObj *topic = [_searchResult objectAtIndex:indexPath.row];
//        topic.tick = YES;
////        [self historyAddTopicObj:topic];
//        [[AppCache sharedInstance] searchHistoryAddTopic:topic.topic];
//
//        //  add to search label
//        [self selectResultAddString:topic.topic];
////        [self reshowSearchLabel];
//
//        //  hide search bar
//        [self hideSearchModel];
//
//        [MobClick event:@"368" label:topic.topic];
//    }
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//    //    return _searching ? 1 : 4;
//}
//
//- (NSInteger)mathRosw:(NSInteger)count {
//    
//    int remainder = count % 2;
//    count = count / 2;
//    if (remainder == 0) {
//        return count;
//    }else{
//        return count + 1;
//    }
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return _searchResult.count;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [_searchField resignFirstResponder];
//}
//@end
