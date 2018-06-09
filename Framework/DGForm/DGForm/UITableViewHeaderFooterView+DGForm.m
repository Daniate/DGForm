//
//  UITableViewHeaderFooterView+DGForm.m
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "UITableViewHeaderFooterView+DGForm.h"
#import "DGFormProtocols.h"

@implementation UITableViewHeaderFooterView (DGForm)
+ (nullable UIView *)dg_form_viewForForm:(DGForm *)form
                               tableView:(UITableView *)tableView
                                 section:(NSInteger)section
                                    type:(DGFormSectionType)type {
    DGFormSection *sectionModel = [form sectionModelForSection:section];
    DGFormSectionHeaderFooter *headerFooterModel = nil;
    if (type == DGFormSectionTypeHeader) {
        headerFooterModel = sectionModel.header;
    } else {
        headerFooterModel = sectionModel.footer;
    }
    if (headerFooterModel.headerFooterView) {
        return headerFooterModel.headerFooterView;
    }
    NSString *reuseIdentifier = headerFooterModel.headerFooterReuseIdentifier;
    UITableViewHeaderFooterView<DGFormUpdating> *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    if ([headerFooterView respondsToSelector:@selector(dg_form_updateWithData:)]) {
        [headerFooterView dg_form_updateWithData:headerFooterModel.data];
    }
    if (headerFooterView) {
        return headerFooterView;
    }
    UITableViewHeaderFooterView *view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:nil];
    return view;
}
@end
