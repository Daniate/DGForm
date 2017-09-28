//
//  DGViewControllerWithTableViewAbstraction.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModels.h"
#import "DGTableViewAbstractionProtocols.h"
#import "DGTableViewDataSourceImpl.h"
#import "DGTableViewDelegateImpl.h"

@interface DGViewControllerWithEstimatedHeightTableViewAbstraction : UIViewController
@property (nonatomic, weak, nullable) IBOutlet UITableView *tableView;
@property (nonatomic, readonly, strong, nonnull) DGTableViewAbstractionModel *tableViewModel;
@property (nonatomic, readonly, strong, nonnull) DGTableViewDataSourceImpl *tableViewDataSource;
@property (nonatomic, readonly, strong, nonnull) __kindof DGTableViewEstimatedHeightDelegateImpl *tableViewDelegate;
/**
 After assign a tableView (not nil) and add it to a superview,
 call this method, let table view support estimated height.
 */
- (void)configureEstimatedHeightTableView;
@end

/**
 This class override the `- configureEstimatedHeightTableView` method, no estimate.
 */
@interface DGViewControllerWithTableViewAbstraction : DGViewControllerWithEstimatedHeightTableViewAbstraction

@end
