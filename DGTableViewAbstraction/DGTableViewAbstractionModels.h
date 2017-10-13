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

NS_ASSUME_NONNULL_BEGIN

@interface DGTableViewAbstractionRowModel : NSObject
@property (nonatomic, strong, readonly) Class cellClass;
/**
 default is NSStringFromClass(cellClass)
 */
@property (nonatomic, copy) NSString *cellReuseIdentifier;
/**
 default is 44
 */
@property (nonatomic, assign) CGFloat cellHeight;
/**
 model or view model
 */
@property (nonatomic, strong, nullable) id data;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCellClass:(Class)cellClass NS_DESIGNATED_INITIALIZER;
@end

@interface DGTableViewSectionHeaderFooterModel : NSObject
@property (nonatomic, strong, readonly) Class headerFooterClass;
/**
 default is NSStringFromClass(headerFooterClass)
 */
@property (nonatomic, copy) NSString *headerFooterReuseIdentifier;
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
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithHeaderFooterClass:(Class)headerFooterClass NS_DESIGNATED_INITIALIZER;
@end

@interface DGTableViewAbstractionSectionModel : NSObject
@property (nonatomic, readonly, strong) DGTableViewSectionHeaderFooterModel *header;
@property (nonatomic, readonly, strong) NSMutableArray<DGTableViewAbstractionRowModel *> *rows;
@property (nonatomic, readonly, strong) DGTableViewSectionHeaderFooterModel *footer;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithHeaderClass:(Class)headerClass footerClass:(Class)footerClass NS_DESIGNATED_INITIALIZER;
@end

@interface DGTableViewAbstractionModel : NSObject
@property (nonatomic, strong, readonly) NSMutableArray<DGTableViewAbstractionSectionModel *> *sections;

/**
 register headers/footers/cells

 @param tableView tableView
 */
- (void)registerClassesForTableView:(UITableView *)tableView;
- (DGTableViewAbstractionSectionModel * _Nullable)sectionModelForSection:(NSInteger)section;
- (DGTableViewAbstractionRowModel * _Nullable)rowModelForIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
