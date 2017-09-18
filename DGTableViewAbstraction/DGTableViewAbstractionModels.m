//
//  DGTableViewAbstractionModel.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionModels.h"

@implementation DGTableViewAbstractionRowModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellHeight = 44;
    }
    return self;
}

- (void)setCellClass:(Class)cellClass {
    if (cellClass && _cellClass != cellClass) {
        _cellClass = cellClass;
        
        if (self.cellReuseIdentifier == nil) {
            self.cellReuseIdentifier = NSStringFromClass(cellClass);
        }
    }
}

- (NSString *)description {
    NSMutableString *desc = [NSMutableString stringWithString:@"DGTableViewAbstractionRowModel:"];
    [desc appendFormat:@"\n\tcellClass: %@", self.cellClass];
    [desc appendFormat:@"\n\tcellReuseIdentifier: %@", self.cellReuseIdentifier];
    [desc appendFormat:@"\n\tcellHeight: %f", self.cellHeight];
    [desc appendString:@"\n"];
    return desc.copy;
}

@end

@implementation DGTableViewSectionHeaderFooterModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _headerFooterHeight = DG_CGFLOAT_EPSILON;
    }
    return self;
}

- (void)setHeaderFooterClass:(Class)headerFooterClass {
    if (headerFooterClass && _headerFooterClass != headerFooterClass) {
        _headerFooterClass = headerFooterClass;
        
        if (self.headerFooterReuseIdentifier == nil) {
            self.headerFooterReuseIdentifier = NSStringFromClass(headerFooterClass);
        }
    }
}

- (NSString *)description {
    NSMutableString *desc = [NSMutableString stringWithString:@"DGTableViewSectionHeaderFooterModel:"];
    [desc appendFormat:@"\n\theaderFooterClass: %@", self.headerFooterClass];
    [desc appendFormat:@"\n\theaderFooterReuseIdentifier: %@", self.headerFooterReuseIdentifier];
    [desc appendFormat:@"\n\theaderFooterHeight: %f", self.headerFooterHeight];
    [desc appendString:@"\n"];
    return desc.copy;
}

@end

@implementation DGTableViewAbstractionSectionModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _header = [DGTableViewSectionHeaderFooterModel new];
        
        _rows = @[].mutableCopy;
        
        _footer = [DGTableViewSectionHeaderFooterModel new];
    }
    return self;
}

- (NSString *)description {
    NSMutableString *desc = [NSMutableString stringWithString:@"DGTableViewAbstractionSectionModel:"];
    [desc appendFormat:@"\n\theader: %@", self.header];
    [desc appendFormat:@"\n\tfooter: %@", self.footer];
    [desc appendFormat:@"\n\trows: %@", self.rows];
    [desc appendString:@"\n"];
    return desc.copy;
}

@end

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
            [self _registerCell:obj forTableView:tableView];
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

- (void)_registerCell:(DGTableViewAbstractionRowModel * _Nonnull)model forTableView:(UITableView * _Nonnull)tableView {
    NSString *cellReuseIdentifier = model.cellReuseIdentifier;
    if (model.cellClass && !cellReuseIdentifier) {
        cellReuseIdentifier = NSStringFromClass(model.cellClass);
    }
    if (model.cellClass && cellReuseIdentifier) {
        [tableView registerClass:model.cellClass forCellReuseIdentifier:cellReuseIdentifier];
        
        NSString *nibName = NSStringFromClass(model.cellClass);
        NSString *path = [[NSBundle bundleForClass:self.class] pathForResource:nibName ofType:@"nib"];
        if (path) {
            [tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:cellReuseIdentifier];
        }
    }
}

@end
