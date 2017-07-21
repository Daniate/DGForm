//
//  DGTableViewAbstractionRowModel.h
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
