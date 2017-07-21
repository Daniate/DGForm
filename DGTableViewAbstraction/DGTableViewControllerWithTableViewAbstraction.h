//
//  DGTableViewControllerWithTableViewAbstraction.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModel.h"
#import "DGTableViewAbstractionProtocols.h"

@interface DGTableViewControllerWithTableViewAbstraction : UITableViewController <DGTableViewAbstractionDelegate>
@property (nonatomic, readonly, strong, nonnull) DGTableViewAbstractionModel *tableViewModel;
- (void)registerClassesForTableView;
@end
