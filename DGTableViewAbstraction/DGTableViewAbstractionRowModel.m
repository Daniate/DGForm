//
//  DGTableViewAbstractionRowModel.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionRowModel.h"

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
