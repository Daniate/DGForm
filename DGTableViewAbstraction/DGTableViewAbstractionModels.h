//
//  DGTableViewAbstractionModels.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DG_CGFLOAT_EPSILON
#undef DG_CGFLOAT_EPSILON
#endif

#if CGFLOAT_IS_DOUBLE
#define DG_CGFLOAT_EPSILON DBL_EPSILON
#else
#define DG_CGFLOAT_EPSILON FLT_EPSILON
#endif

typedef NS_ENUM(NSUInteger, DGTableViewHeaderFooterType) {
    DGTableViewHeaderFooterTypeHeader,
    DGTableViewHeaderFooterTypeFooter,
};

@interface DGTableViewAbstractionRowModel : NSObject
/**
 if `cellReuseIdentifier` is nil, will set `cellReuseIdentifier` = NSStringFromClass(cellClass)
 */
@property (nonatomic, strong, nullable) Class cellClass;
@property (nonatomic, copy, nullable) NSString *cellReuseIdentifier;
/**
 default is 44
 */
@property (nonatomic, assign) CGFloat cellHeight;
/**
 model or view model
 */
@property (nonatomic, strong, nullable) id data;
@end

@interface DGTableViewSectionHeaderFooterModel : NSObject
/**
 if `headerFooterReuseIdentifier` is nil, will set `headerFooterReuseIdentifier` = NSStringFromClass(headerFooterClass)
 */
@property (nonatomic, strong, nullable) Class headerFooterClass;
@property (nonatomic, copy, nullable) NSString *headerFooterReuseIdentifier;
/**
 Its priority is higher than `headerFooterClass` & `headerFooterReuseIdentifier`
 */
@property (nonatomic, strong, nullable) UIView *headerFooterView;
/**
 default is DG_CGFLOAT_EPSILON, see above macro define
 */
@property (nonatomic, assign) CGFloat headerFooterHeight;
/**
 model or view model
 */
@property (nonatomic, strong, nullable) id data;
@end

@interface DGTableViewAbstractionSectionModel : NSObject
@property (nonatomic, readonly, strong, nonnull) DGTableViewSectionHeaderFooterModel *header;
@property (nonatomic, readonly, strong, nonnull) NSMutableArray<DGTableViewAbstractionRowModel *> *rows;
@property (nonatomic, readonly, strong, nonnull) DGTableViewSectionHeaderFooterModel *footer;
@end

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
