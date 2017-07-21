//
//  DGTableViewAbstractionSectionModel.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionRowModel.h"

@interface DGTableViewSectionHeaderFooterModel : NSObject
/**
 if `headerFooterReuseIdentifier` is nil, will set `headerFooterReuseIdentifier` = NSStringFromClass(headerFooterClass)
 */
@property (nonatomic, strong, nullable) Class headerFooterClass;
@property (nonatomic, copy, nullable) NSString *headerFooterReuseIdentifier;
/**
 default is DG_CGFLOAT_EPSILON, see `DGTableViewAbstractionRowModel.h`
 */
@property (nonatomic, assign) CGFloat headerFooterHeight;
/**
 model or view model
 */
@property (nonatomic, strong, nullable) id data;
@end

@interface DGTableViewAbstractionSectionModel : NSObject
@property (nonatomic, strong, nonnull) DGTableViewSectionHeaderFooterModel *header;
@property (nonatomic, readonly, strong, nonnull) NSMutableArray<DGTableViewAbstractionRowModel *> *rows;
@property (nonatomic, strong, nonnull) DGTableViewSectionHeaderFooterModel *footer;
@end
