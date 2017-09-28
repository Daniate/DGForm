//
//  DGViewControllerWithTableViewAbstraction.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGViewControllerWithTableViewAbstraction.h"

@interface DGViewControllerWithEstimatedHeightTableViewAbstraction () {
@protected
    DGTableViewAbstractionModel *_tableViewModel;
    DGTableViewDataSourceImpl *_tableViewDataSource;
    __kindof DGTableViewEstimatedHeightDelegateImpl *_tableViewDelegate;
}
@end

@implementation DGViewControllerWithEstimatedHeightTableViewAbstraction

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureEstimatedHeightTableView {
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.tableView.sectionFooterHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.estimatedSectionHeaderHeight = 30;
    self.tableView.estimatedSectionFooterHeight = 30;
    self.tableView.dataSource = self.tableViewDataSource;
    self.tableView.delegate = self.tableViewDelegate;
}

#pragma mark - Private
- (void)_init {
    _tableViewModel = [DGTableViewAbstractionModel new];
    _tableViewDataSource = [[DGTableViewDataSourceImpl alloc] initWithModel:_tableViewModel];
    _tableViewDelegate = [[DGTableViewEstimatedHeightDelegateImpl alloc] initWithModel:_tableViewModel];
}

@end

@interface DGViewControllerWithTableViewAbstraction ()

@end

@implementation DGViewControllerWithTableViewAbstraction

- (void)configureEstimatedHeightTableView {
    self.tableView.dataSource = self.tableViewDataSource;
    self.tableView.delegate = self.tableViewDelegate;
}

#pragma mark - Private
- (void)_init {
    _tableViewModel = [DGTableViewAbstractionModel new];
    _tableViewDataSource = [[DGTableViewDataSourceImpl alloc] initWithModel:_tableViewModel];
    _tableViewDelegate = [[DGTableViewDelegateImpl alloc] initWithModel:_tableViewModel];
}

@end
