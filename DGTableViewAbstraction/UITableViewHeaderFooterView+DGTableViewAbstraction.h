//
//  UITableViewHeaderFooterView+DGTableViewAbstraction.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewHeaderFooterView (DGTableViewAbstraction)
+ (nullable UIView *)dg_tableViewModel:(DGTableViewAbstractionModel *)tableViewModel
                             tableView:(UITableView *)tableView
             headerFooterViewInSection:(NSInteger)section
                                  type:(DGTableViewHeaderFooterType)type;
@end

NS_ASSUME_NONNULL_END
