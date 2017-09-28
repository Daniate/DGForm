//
//  DGTableViewControllerWithTableViewAbstraction.h
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

@interface DGTableViewControllerWithEstimatedHeightTableViewAbstraction : UITableViewController
@property (nonatomic, readonly, strong, nonnull) DGTableViewAbstractionModel *tableViewModel;
@property (nonatomic, readonly, strong, nonnull) DGTableViewDataSourceImpl *tableViewDataSource;
@property (nonatomic, readonly, strong, nonnull) __kindof DGTableViewEstimatedHeightDelegateImpl *tableViewDelegate;
@end

@interface DGTableViewControllerWithTableViewAbstraction : DGTableViewControllerWithEstimatedHeightTableViewAbstraction

@end
