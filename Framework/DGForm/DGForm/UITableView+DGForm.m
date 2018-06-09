//
//  UITableView+DGForm.m
//  DGForm
//
//  Created by Daniate on 2018/5/13.
//  Copyright © 2018年 Daniate. All rights reserved.
//

#import "UITableView+DGForm.h"

@implementation UITableView (DGForm)
- (void)dg_form_enableEstimatedHeight:(BOOL)enable {
    self.rowHeight = UITableViewAutomaticDimension;
    self.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.sectionFooterHeight = UITableViewAutomaticDimension;
    if (enable) {
        self.estimatedRowHeight = UITableViewAutomaticDimension;
        self.estimatedSectionHeaderHeight = UITableViewAutomaticDimension;
        self.estimatedSectionFooterHeight = UITableViewAutomaticDimension;
    } else {
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
}
@end
