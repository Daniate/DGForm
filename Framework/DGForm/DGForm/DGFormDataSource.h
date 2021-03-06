//
//  DGFormDataSource.h
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGFormModels.h"
#import "DGFormProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface DGFormDataSource : NSObject <UITableViewDataSource>
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithForm:(DGForm *)form NS_DESIGNATED_INITIALIZER;
@property (nonatomic, weak, nullable) IBOutlet id<DGFormDataSource> dataSource;
@end

NS_ASSUME_NONNULL_END
