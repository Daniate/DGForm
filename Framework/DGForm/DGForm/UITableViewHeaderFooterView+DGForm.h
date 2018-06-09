//
//  UITableViewHeaderFooterView+DGForm.h
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGFormModels.h"

typedef NS_ENUM(NSUInteger, DGFormSectionType) {
    DGFormSectionTypeHeader,
    DGFormSectionTypeFooter,
};

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewHeaderFooterView (DGForm)
+ (nullable UIView *)dg_form_viewForForm:(DGForm *)form
                               tableView:(UITableView *)tableView
                                 section:(NSInteger)section
                                    type:(DGFormSectionType)type;
@end

NS_ASSUME_NONNULL_END
