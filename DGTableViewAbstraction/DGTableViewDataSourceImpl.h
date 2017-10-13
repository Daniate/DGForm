//
//  DGTableViewDataSourceImpl.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModels.h"
#import "DGTableViewAbstractionProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface DGTableViewDataSourceImpl : NSObject <UITableViewDataSource>
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithModel:(DGTableViewAbstractionModel *)model NS_DESIGNATED_INITIALIZER;
@property (nonatomic, weak, nullable) IBOutlet id<DGTableViewAbstractionDataSource> dataSource;
@end

NS_ASSUME_NONNULL_END
