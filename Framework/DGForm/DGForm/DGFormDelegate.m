//
//  DGFormDelegateDelegate.m
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGFormDelegate.h"
#import "DGFormProtocols.h"
#import "UITableViewHeaderFooterView+DGForm.h"

@interface DGFormEstimatedHeightDelegate ()
@property (nonatomic, strong) DGForm *form;
@end

@implementation DGFormEstimatedHeightDelegate

- (instancetype)initWithForm:(DGForm *)form {
    if (self = [super init]) {
        _form = form;
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(dg_form_tableView:willDisplayCell:row:indexPath:)]) {
        DGFormRow *row = [self.form rowModelForIndexPath:indexPath];
        [self.delegate dg_form_tableView:tableView willDisplayCell:cell row:row indexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([self.delegate respondsToSelector:@selector(dg_form_tableView:willDisplayHeaderView:header:section:)]) {
        DGFormSection *sectionModel = [self.form sectionModelForSection:section];
        [self.delegate dg_form_tableView:tableView willDisplayHeaderView:view header:sectionModel.header section:section];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([self.delegate respondsToSelector:@selector(dg_form_tableView:willDisplayFooterView:footer:section:)]) {
        DGFormSection *sectionModel = [self.form sectionModelForSection:section];
        [self.delegate dg_form_tableView:tableView willDisplayFooterView:view footer:sectionModel.footer section:section];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(dg_form_tableView:didSelectRow:indexPath:)]) {
        DGFormRow *row = [self.form rowModelForIndexPath:indexPath];
        [self.delegate dg_form_tableView:tableView didSelectRow:row indexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(dg_form_tableView:didDeselectRow:indexPath:)]) {
        DGFormRow *row = [self.form rowModelForIndexPath:indexPath];
        [self.delegate dg_form_tableView:tableView didDeselectRow:row indexPath:indexPath];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UITableViewHeaderFooterView dg_form_viewForForm:self.form tableView:tableView section:section type:DGFormSectionTypeHeader];
    if ([self.delegate respondsToSelector:@selector(dg_form_tableView:headerView:header:section:)]) {
        [self.delegate dg_form_tableView:tableView headerView:headerView header:[self.form sectionModelForSection:section].header section:section];
    }
    return headerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [UITableViewHeaderFooterView dg_form_viewForForm:self.form tableView:tableView section:section type:DGFormSectionTypeFooter];
    if ([self.delegate respondsToSelector:@selector(dg_form_tableView:footerView:footer:section:)]) {
        [self.delegate dg_form_tableView:tableView footerView:footerView footer:[self.form sectionModelForSection:section].footer section:section];
    }
    return footerView;
}

@end

@implementation DGFormDelegate

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DGFormRow *rowModel = [self.form rowModelForIndexPath:indexPath];
    return rowModel.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    DGFormSection *sectionModel = [self.form sectionModelForSection:section];
    if (sectionModel) {
        return sectionModel.header.headerFooterHeight;
    }
    return DG_CGFLOAT_EPSILON;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    DGFormSection *sectionModel = [self.form sectionModelForSection:section];
    if (sectionModel) {
        return sectionModel.footer.headerFooterHeight;
    }
    return DG_CGFLOAT_EPSILON;
}

@end
