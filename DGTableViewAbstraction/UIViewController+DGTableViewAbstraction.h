//
//  UIViewController+DGTableViewAbstraction.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/21.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionModel.h"
#import "DGTableViewAbstractionProtocols.h"

@interface UIViewController (DGTableViewAbstraction)

- (nullable UIView *)dg_tableViewModel:(DGTableViewAbstractionModel * _Nonnull)tableViewModel
                             tableView:(UITableView * _Nonnull)tableView
             headerFooterViewInSection:(NSInteger)section
                                  type:(DGTableViewHeaderFooterType)type;

@end
