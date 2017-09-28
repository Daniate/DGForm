//
//  DGTableViewDataSourceImpl.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewDataSourceImpl.h"
#import "DGTableViewAbstractionProtocols.h"

@interface DGTableViewDataSourceImpl ()
@property (nonatomic, strong) DGTableViewAbstractionModel *model;
@end

@implementation DGTableViewDataSourceImpl

- (instancetype)initWithModel:(DGTableViewAbstractionModel *)model {
    if (self = [super init]) {
        _model = model;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (NSInteger)self.model.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < self.model.sections.count) {
        return (NSInteger)self.model.sections[section].rows.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<DGTableViewAbstractionCellUpdating> *cell = nil;
    DGTableViewAbstractionRowModel *rowModel = [self.model rowModelForIndexPath:indexPath];
    if (rowModel.cellReuseIdentifier) {
        cell = [tableView dequeueReusableCellWithIdentifier:rowModel.cellReuseIdentifier forIndexPath:indexPath];
    } else if (rowModel.cellClass) {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(rowModel.cellClass) forIndexPath:indexPath];
    }
    if ([cell respondsToSelector:@selector(dg_updateCellWithData:)]) {
        [cell dg_updateCellWithData:rowModel.data];
    }
    if ([self.dataSource respondsToSelector:@selector(dg_tableView:cell:rowModel:atIndexPath:)]) {
        [self.dataSource dg_tableView:tableView cell:cell rowModel:rowModel atIndexPath:indexPath];
    }
    return cell;
}

@end
