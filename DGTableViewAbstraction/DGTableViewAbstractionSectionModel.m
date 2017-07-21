//
//  DGTableViewAbstractionSectionModel.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionSectionModel.h"

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
        _header.headerFooterClass = [UITableViewHeaderFooterView class];
        
        _rows = @[].mutableCopy;
        
        _footer = [DGTableViewSectionHeaderFooterModel new];
        _footer.headerFooterClass = [UITableViewHeaderFooterView class];
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
