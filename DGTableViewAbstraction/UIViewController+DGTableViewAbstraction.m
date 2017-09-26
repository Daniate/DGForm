//
//  UIViewController+DGTableViewAbstraction.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/21.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "UIViewController+DGTableViewAbstraction.h"

@implementation UIViewController (DGTableViewAbstraction)

- (nullable UIView *)dg_tableViewModel:(DGTableViewAbstractionModel * _Nonnull)tableViewModel
                             tableView:(UITableView * _Nonnull)tableView
             headerFooterViewInSection:(NSInteger)section
                                  type:(DGTableViewHeaderFooterType)type {
    DGTableViewAbstractionSectionModel *sectionModel = [tableViewModel sectionModelForSection:section];
    DGTableViewSectionHeaderFooterModel *headerFooterModel = nil;
    if (type == DGTableViewHeaderFooterTypeHeader) {
        headerFooterModel = sectionModel.header;
    } else if (type == DGTableViewHeaderFooterTypeFooter) {
        headerFooterModel = sectionModel.footer;
    }
    if (headerFooterModel.headerFooterView) {
        return headerFooterModel.headerFooterView;
    }
    NSString *reuseIdentifier = headerFooterModel.headerFooterReuseIdentifier;
    if (reuseIdentifier == nil) {
        reuseIdentifier = NSStringFromClass(headerFooterModel.headerFooterClass);
    }
    UITableViewHeaderFooterView<DGTableViewAbstractionHeaderFooterUpdating> *headerFooterView = nil;
    if (reuseIdentifier) {
        headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    }
    if ([headerFooterView respondsToSelector:@selector(dg_updateHeaderFooterWithData:)]) {
        [headerFooterView dg_updateHeaderFooterWithData:headerFooterModel.data];
    }
    if (headerFooterView) {
        return headerFooterView;
    }
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

@end
