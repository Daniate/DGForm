//
//  DGTableViewAbstractionModel.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionModels.h"

@implementation DGTableViewAbstractionRowModel

- (instancetype)initWithCellClass:(Class)cellClass {
    if (self = [super init]) {
        _cellHeight = 44;
        _cellReuseIdentifier = NSStringFromClass(cellClass);
    }
    return self;
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

- (instancetype)initWithHeaderFooterClass:(Class)headerFooterClass {
    if (self = [super init]) {
        _headerFooterHeight = DG_CGFLOAT_EPSILON;
        _headerFooterReuseIdentifier = NSStringFromClass(headerFooterClass);
    }
    return self;
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

- (instancetype)initWithHeaderClass:(Class)headerClass footerClass:(Class)footerClass {
    self = [super init];
    if (self) {
        _header = [[DGTableViewSectionHeaderFooterModel alloc] initWithHeaderFooterClass:headerClass];
        
        _rows = @[].mutableCopy;
        
        _footer = [[DGTableViewSectionHeaderFooterModel alloc] initWithHeaderFooterClass:footerClass];
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

- (instancetype)init {
    self = [super init];
    if (self) {
        _sections = @[].mutableCopy;
    }
    return self;
}

- (void)registerClassesForTableView:(UITableView *)tableView {
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

- (DGTableViewAbstractionRowModel * _Nullable)rowModelForIndexPath:(NSIndexPath *)indexPath {
    DGTableViewAbstractionSectionModel *sectionModel = [self sectionModelForSection:indexPath.section];
    NSInteger row = indexPath.row;
    if (row >= 0 && row < sectionModel.rows.count) {
        return sectionModel.rows[row];
    }
    return nil;
}

#pragma mark - Private
- (void)_registerHeaderFooter:(DGTableViewSectionHeaderFooterModel *)model forTableView:(UITableView *)tableView {
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

- (void)_registerCell:(DGTableViewAbstractionRowModel *)model forTableView:(UITableView *)tableView {
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
