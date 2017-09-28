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

@interface DGTableViewDataSourceImpl : NSObject <UITableViewDataSource>
- (instancetype _Nullable)init UNAVAILABLE_ATTRIBUTE;
- (instancetype _Nonnull)initWithModel:(DGTableViewAbstractionModel * _Nonnull)model NS_DESIGNATED_INITIALIZER;
@property (nonatomic, weak, nullable) IBOutlet id<DGTableViewAbstractionDataSource> dataSource;
@end
