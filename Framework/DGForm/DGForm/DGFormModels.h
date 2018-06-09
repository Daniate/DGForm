//
//  DGFormModels.h
//  DGForm
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

NS_ASSUME_NONNULL_BEGIN

@interface DGFormRow : NSObject
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
/**
 Init row model

 @param cellClass if pass nil, will use `UITableViewCell`
 @return DGFormRow
 */
- (instancetype)initWithCellClass:(nullable Class)cellClass NS_DESIGNATED_INITIALIZER;
@end

@interface DGFormSectionHeaderFooter : NSObject
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
 model data
 */
@property (nonatomic, strong, nullable) id data;
/**
 Init section header footer model

 @param headerFooterClass if pass nil, will use `UITableViewHeaderFooterView`
 @return DGFormSection
 */
- (instancetype)initWithHeaderFooterClass:(nullable Class)headerFooterClass NS_DESIGNATED_INITIALIZER;
@end

@interface DGFormSection : NSObject
@property (nonatomic, readonly, strong) DGFormSectionHeaderFooter *header;
@property (nonatomic, readonly, strong) NSMutableArray<DGFormRow *> *rows;
@property (nonatomic, readonly, strong) DGFormSectionHeaderFooter *footer;
- (instancetype)initWithHeaderClass:(nullable Class)headerClass footerClass:(nullable Class)footerClass NS_DESIGNATED_INITIALIZER;
@end

@interface DGForm : NSObject
@property (nonatomic, strong, readonly) NSMutableArray<DGFormSection *> *sections;

/**
 register headers/footers/cells

 @param tableView tableView
 */
- (void)registerClassesForTableView:(UITableView *)tableView;
- (DGFormSection * _Nullable)sectionModelForSection:(NSInteger)section;
- (DGFormRow * _Nullable)rowModelForIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
