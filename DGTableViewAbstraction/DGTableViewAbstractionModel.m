//
//  DGTableViewAbstractionModel.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionModel.h"

@implementation DGTableViewAbstractionModel

- (instancetype _Nonnull)init {
    self = [super init];
    if (self) {
        _sections = @[].mutableCopy;
    }
    return self;
}

- (void)registerClassesForTableView:(UITableView * _Nonnull)tableView {
    if (tableView == nil) {
        return;
    }
    [self.sections enumerateObjectsUsingBlock:^(DGTableViewAbstractionSectionModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // register headers
        [self _registerHeaderFooter:obj.header forTableView:tableView];
        // register footers
        [self _registerHeaderFooter:obj.footer forTableView:tableView];
        // register cells
        [obj.rows enumerateObjectsUsingBlock:^(DGTableViewAbstractionRowModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *cellReuseIdentifier = obj.cellReuseIdentifier;
            if (obj.cellClass && !cellReuseIdentifier) {
                cellReuseIdentifier = NSStringFromClass(obj.cellClass);
            }
            if (obj.cellClass && cellReuseIdentifier) {
                [tableView registerClass:obj.cellClass forCellReuseIdentifier:cellReuseIdentifier];
                
                NSString *nibName = NSStringFromClass(obj.cellClass);
                NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:nibName ofType:@"nib"];
                if (path) {
                    [tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:cellReuseIdentifier];
                }
            }
        }];
    }];
}

- (DGTableViewAbstractionSectionModel * _Nullable)sectionModelForSection:(NSInteger)section {
    if (section >= 0 && section < self.sections.count) {
        return self.sections[section];
    }
    return nil;
}

- (DGTableViewAbstractionRowModel * _Nullable)rowModelForIndexPath:(NSIndexPath * _Nonnull)indexPath {
    DGTableViewAbstractionSectionModel *sectionModel = [self sectionModelForSection:indexPath.section];
    NSInteger row = indexPath.row;
    if (row >= 0 && row < sectionModel.rows.count) {
        return sectionModel.rows[row];
    }
    return nil;
}

#pragma mark - Private
- (void)_registerHeaderFooter:(DGTableViewSectionHeaderFooterModel * _Nonnull)model forTableView:(UITableView * _Nonnull)tableView {
    NSString *reuseIdentifier = model.headerFooterReuseIdentifier;
    if (model.headerFooterClass && !reuseIdentifier) {
        reuseIdentifier = NSStringFromClass(model.headerFooterClass);
    }
    if (model.headerFooterClass && reuseIdentifier) {
        [tableView registerClass:model.headerFooterClass forHeaderFooterViewReuseIdentifier:reuseIdentifier];
        
        NSString *nibName = NSStringFromClass(model.headerFooterClass);
        NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:nibName ofType:@"nib"];
        if (path) {
            [tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:reuseIdentifier];
        }
    }
}

@end
