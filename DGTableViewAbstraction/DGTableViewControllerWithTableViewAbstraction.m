//
//  DGTableViewControllerWithTableViewAbstraction.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewControllerWithTableViewAbstraction.h"

@interface DGTableViewControllerWithEstimatedHeightTableViewAbstraction () {
@protected
    DGTableViewAbstractionModel *_tableViewModel;
    DGTableViewDataSourceImpl *_tableViewDataSource;
    __kindof DGTableViewEstimatedHeightDelegateImpl *_tableViewDelegate;
}
@end

@implementation DGTableViewControllerWithEstimatedHeightTableViewAbstraction

- (instancetype)initWithStyle:(UITableViewStyle)style {
    if (self = [super initWithStyle:style]) {
        [self _init];
    }
    return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self _init];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.tableView.sectionFooterHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.estimatedSectionHeaderHeight = 30;
    self.tableView.estimatedSectionFooterHeight = 30;
    self.tableView.dataSource = self.tableViewDataSource;
    self.tableView.delegate = self.tableViewDelegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerClassesForTableView {
    [self.tableViewModel registerClassesForTableView:self.tableView];
}

#pragma mark - Private
- (void)_init {
    _tableViewModel = [DGTableViewAbstractionModel new];
    _tableViewDataSource = [[DGTableViewDataSourceImpl alloc] initWithModel:_tableViewModel];
    _tableViewDelegate = [[DGTableViewEstimatedHeightDelegateImpl alloc] initWithModel:_tableViewModel];
}

@end

@implementation DGTableViewControllerWithTableViewAbstraction

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // cancel estimate
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}

#pragma mark - Private
- (void)_init {
    _tableViewModel = [DGTableViewAbstractionModel new];
    _tableViewDataSource = [[DGTableViewDataSourceImpl alloc] initWithModel:_tableViewModel];
    _tableViewDelegate = [[DGTableViewDelegateImpl alloc] initWithModel:_tableViewModel];
}

@end
