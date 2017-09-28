//
//  UITableViewHeaderFooterView+DGTableViewAbstraction.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModels.h"

@interface UITableViewHeaderFooterView (DGTableViewAbstraction)
+ (nullable UIView *)dg_tableViewModel:(DGTableViewAbstractionModel * _Nonnull)tableViewModel
                             tableView:(UITableView * _Nonnull)tableView
             headerFooterViewInSection:(NSInteger)section
                                  type:(DGTableViewHeaderFooterType)type;
@end
