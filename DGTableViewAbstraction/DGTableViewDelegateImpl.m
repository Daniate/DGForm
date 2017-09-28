//
//  DGTableViewDelegateImpl.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewDelegateImpl.h"
#import "DGTableViewAbstractionProtocols.h"
#import "UITableViewHeaderFooterView+DGTableViewAbstraction.h"

@interface DGTableViewEstimatedHeightDelegateImpl ()
@property (nonatomic, strong) DGTableViewAbstractionModel *model;
@end

@implementation DGTableViewEstimatedHeightDelegateImpl

- (instancetype)initWithModel:(DGTableViewAbstractionModel *)model {
    if (self = [super init]) {
        _model = model;
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DGTableViewAbstractionRowModel *rowModel = [self.model rowModelForIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(dg_tableView:didSelectRowModel:atIndexPath:)]) {
        [self.delegate dg_tableView:tableView didSelectRowModel:rowModel atIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    DGTableViewAbstractionRowModel *rowModel = [self.model rowModelForIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(dg_tableView:didDeselectRowModel:atIndexPath:)]) {
        [self.delegate dg_tableView:tableView didDeselectRowModel:rowModel atIndexPath:indexPath];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UITableViewHeaderFooterView dg_tableViewModel:self.model tableView:tableView headerFooterViewInSection:section type:DGTableViewHeaderFooterTypeHeader];
    if ([self.delegate respondsToSelector:@selector(dg_tableView:headerView:headerModel:inSection:)]) {
        [self.delegate dg_tableView:tableView headerView:headerView headerModel:[self.model sectionModelForSection:section].header inSection:section];
    }
    return headerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [UITableViewHeaderFooterView dg_tableViewModel:self.model tableView:tableView headerFooterViewInSection:section type:DGTableViewHeaderFooterTypeFooter];
    if ([self.delegate respondsToSelector:@selector(dg_tableView:footerView:footerModel:inSection:)]) {
        [self.delegate dg_tableView:tableView footerView:footerView footerModel:[self.model sectionModelForSection:section].footer inSection:section];
    }
    return footerView;
}

@end

@implementation DGTableViewDelegateImpl

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DGTableViewAbstractionRowModel *rowModel = [self.model rowModelForIndexPath:indexPath];
    return rowModel.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    DGTableViewAbstractionSectionModel *sectionModel = [self.model sectionModelForSection:section];
    if (sectionModel) {
        return sectionModel.header.headerFooterHeight;
    }
    return DG_CGFLOAT_EPSILON;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    DGTableViewAbstractionSectionModel *sectionModel = [self.model sectionModelForSection:section];
    if (sectionModel) {
        return sectionModel.footer.headerFooterHeight;
    }
    return DG_CGFLOAT_EPSILON;
}

@end
