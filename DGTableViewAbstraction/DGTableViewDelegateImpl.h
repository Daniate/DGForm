//
//  DGTableViewDelegateImpl.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionModels.h"
#import "DGTableViewAbstractionProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface DGTableViewEstimatedHeightDelegateImpl : NSObject <UITableViewDelegate>
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithModel:(DGTableViewAbstractionModel *)model NS_DESIGNATED_INITIALIZER;
@property (nonatomic, weak, nullable) IBOutlet id<DGTableViewAbstractionDelegate> delegate;
@end

@interface DGTableViewDelegateImpl : DGTableViewEstimatedHeightDelegateImpl

@end

NS_ASSUME_NONNULL_END
