//
//  DGTableViewAbstractionModel.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionSectionModel.h"

@interface DGTableViewAbstractionModel : NSObject
@property (nonatomic, strong, nonnull, readonly) NSMutableArray<DGTableViewAbstractionSectionModel *> *sections;

/**
 register headers/footers/cells

 @param tableView tableView
 */
- (void)registerClassesForTableView:(UITableView * _Nonnull)tableView;
- (DGTableViewAbstractionSectionModel * _Nullable)sectionModelForSection:(NSInteger)section;
- (DGTableViewAbstractionRowModel * _Nullable)rowModelForIndexPath:(NSIndexPath * _Nonnull)indexPath;
@end
