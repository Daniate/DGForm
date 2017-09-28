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

@interface DGTableViewEstimatedHeightDelegateImpl : NSObject <UITableViewDelegate>
- (instancetype _Nullable)init UNAVAILABLE_ATTRIBUTE;
- (instancetype _Nonnull)initWithModel:(DGTableViewAbstractionModel * _Nonnull)model NS_DESIGNATED_INITIALIZER;
@property (nonatomic, weak, nullable) IBOutlet id<DGTableViewAbstractionDelegate> delegate;
@end

@interface DGTableViewDelegateImpl : DGTableViewEstimatedHeightDelegateImpl

@end

