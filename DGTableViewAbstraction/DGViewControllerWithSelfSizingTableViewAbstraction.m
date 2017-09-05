//
//  DGViewControllerWithSelfSizingTableViewAbstraction.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGViewControllerWithSelfSizingTableViewAbstraction.h"
#import "UIViewController+DGTableViewAbstraction.h"

@interface DGViewControllerWithSelfSizingTableViewAbstraction ()

@end

@implementation DGViewControllerWithSelfSizingTableViewAbstraction

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"tableView"];
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
    // Do any additional setup after loading the view.
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
    [self addObserver:self forKeyPath:@"tableView" options:NSKeyValueObservingOptionNew context:NULL];
    _tableViewModel = [DGTableViewAbstractionModel new];
}

#pragma mark - NSKeyValueObserving
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"tableView"]) {
        UITableView *tableView = (UITableView *)change[NSKeyValueChangeNewKey];
        if (tableView) {
            tableView.rowHeight = UITableViewAutomaticDimension;
            tableView.estimatedRowHeight = 44;
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (NSInteger)self.tableViewModel.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < self.tableViewModel.sections.count) {
        return (NSInteger)self.tableViewModel.sections[section].rows.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<DGTableViewAbstractionCellUpdating> *cell = nil;
    DGTableViewAbstractionRowModel *rowModel = [self.tableViewModel rowModelForIndexPath:indexPath];
    if (rowModel.cellReuseIdentifier) {
        cell = [tableView dequeueReusableCellWithIdentifier:rowModel.cellReuseIdentifier forIndexPath:indexPath];
    } else if (rowModel.cellClass) {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(rowModel.cellClass) forIndexPath:indexPath];
    }
    if ([cell respondsToSelector:@selector(dg_updateCellWithData:)]) {
        [cell dg_updateCellWithData:rowModel.data];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    DGTableViewAbstractionSectionModel *sectionModel = [self.tableViewModel sectionModelForSection:section];
    if (sectionModel) {
        return sectionModel.header.headerFooterHeight;
    }
    return DG_CGFLOAT_EPSILON;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    DGTableViewAbstractionSectionModel *sectionModel = [self.tableViewModel sectionModelForSection:section];
    if (sectionModel) {
        return sectionModel.footer.headerFooterHeight;
    }
    return DG_CGFLOAT_EPSILON;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DGTableViewAbstractionRowModel *rowModel = [self.tableViewModel rowModelForIndexPath:indexPath];
    if ([self.tableView.delegate respondsToSelector:@selector(dg_tableView:didSelectRowModel:)]) {
        [(id<DGTableViewAbstractionDelegate>)self.tableView.delegate dg_tableView:tableView didSelectRowModel:rowModel];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    DGTableViewAbstractionRowModel *rowModel = [self.tableViewModel rowModelForIndexPath:indexPath];
    if ([self.tableView.delegate respondsToSelector:@selector(dg_tableView:didDeselectRowModel:)]) {
        [(id<DGTableViewAbstractionDelegate>)self.tableView.delegate dg_tableView:tableView didDeselectRowModel:rowModel];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self dg_tableViewModel:self.tableViewModel tableView:tableView headerFooterViewInSection:section type:DGTableViewHeaderFooterTypeHeader];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self dg_tableViewModel:self.tableViewModel tableView:tableView headerFooterViewInSection:section type:DGTableViewHeaderFooterTypeFooter];
}

@end
