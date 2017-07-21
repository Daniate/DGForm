//
//  DGViewControllerWithTableViewAbstraction.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModel.h"
#import "DGTableViewAbstractionProtocols.h"

@interface DGViewControllerWithTableViewAbstraction : UIViewController <UITableViewDataSource, DGTableViewAbstractionDelegate>
/**
 You may not use nib or storyboard, so use `strong` keyword
 */
@property (nonatomic, strong, nullable) IBOutlet UITableView *tableView;
@property (nonatomic, readonly, strong, nonnull) DGTableViewAbstractionModel *tableViewModel;
- (void)registerClassesForTableView;
@end
