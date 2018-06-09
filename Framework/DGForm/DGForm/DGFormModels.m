//
//  DGFormModels.m
//  DGForm
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGFormModels.h"

@implementation DGFormRow

- (instancetype)init {
    return [self initWithCellClass:nil];
}

- (instancetype)initWithCellClass:(nullable Class)cellClass {
    if (self = [super init]) {
        _cellHeight = 44;
        if (cellClass) {
            _cellClass = cellClass;
            _cellReuseIdentifier = NSStringFromClass(cellClass);
        } else {
            _cellClass = [UITableViewCell class];
            _cellReuseIdentifier = @"UITableViewCell";
        }
    }
    return self;
}

@end

@implementation DGFormSectionHeaderFooter

- (instancetype)init {
    return [self initWithHeaderFooterClass:nil];
}

- (instancetype)initWithHeaderFooterClass:(nullable Class)headerFooterClass {
    if (self = [super init]) {
        _headerFooterHeight = DG_CGFLOAT_EPSILON;
        if (headerFooterClass) {
            _headerFooterClass = headerFooterClass;
            _headerFooterReuseIdentifier = NSStringFromClass(headerFooterClass);
        } else {
            _headerFooterClass = [UITableViewHeaderFooterView class];
            _headerFooterReuseIdentifier = @"UITableViewHeaderFooterView";
        }
    }
    return self;
}

@end

@implementation DGFormSection

- (instancetype)init {
    return [self initWithHeaderClass:nil footerClass:nil];
}

- (instancetype)initWithHeaderClass:(nullable Class)headerClass footerClass:(nullable Class)footerClass {
    self = [super init];
    if (self) {
        _header = [[DGFormSectionHeaderFooter alloc] initWithHeaderFooterClass:headerClass];
        _rows = @[].mutableCopy;
        _footer = [[DGFormSectionHeaderFooter alloc] initWithHeaderFooterClass:footerClass];
    }
    return self;
}

@end

@implementation DGForm

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
    [self.sections enumerateObjectsUsingBlock:^(DGFormSection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // register headers
        [self _registerHeaderFooter:obj.header forTableView:tableView];
        // register footers
        [self _registerHeaderFooter:obj.footer forTableView:tableView];
        // register cells
        [obj.rows enumerateObjectsUsingBlock:^(DGFormRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self _registerCell:obj forTableView:tableView];
        }];
    }];
}

- (DGFormSection * _Nullable)sectionModelForSection:(NSInteger)section {
    if (section >= 0 && section < self.sections.count) {
        return self.sections[section];
    }
    return nil;
}

- (DGFormRow * _Nullable)rowModelForIndexPath:(NSIndexPath *)indexPath {
    DGFormSection *sectionModel = [self sectionModelForSection:indexPath.section];
    NSInteger row = indexPath.row;
    if (row >= 0 && row < sectionModel.rows.count) {
        return sectionModel.rows[row];
    }
    return nil;
}

#pragma mark - Private
- (void)_registerHeaderFooter:(DGFormSectionHeaderFooter *)model forTableView:(UITableView *)tableView {
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

- (void)_registerCell:(DGFormRow *)model forTableView:(UITableView *)tableView {
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
