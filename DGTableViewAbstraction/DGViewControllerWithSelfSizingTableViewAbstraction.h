//
//  DGViewControllerWithSelfSizingTableViewAbstraction.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModels.h"
#import "DGTableViewAbstractionProtocols.h"

@interface DGViewControllerWithSelfSizingTableViewAbstraction : UIViewController <UITableViewDataSource, DGTableViewAbstractionDelegate>
/**
 You may not use nib or storyboard, so use `strong` keyword.
 You should create table view by yourself.
 And call:
 self.tableView.rowHeight = UITableViewAutomaticDimension;
 self.tableView.estimatedRowHeight = 44;
 */
@property (nonatomic, strong, nullable) IBOutlet UITableView *tableView;
@property (nonatomic, readonly, strong, nonnull) DGTableViewAbstractionModel *tableViewModel;
- (void)registerClassesForTableView;
@end
