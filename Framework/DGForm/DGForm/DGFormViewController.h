//
//  DGFormViewController.h
//  DGForm
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGFormModels.h"
#import "DGFormDataSource.h"
#import "DGFormDelegate.h"
#import "UITableView+DGForm.h"

NS_ASSUME_NONNULL_BEGIN

@interface DGFormEstimatedHeightViewController : UIViewController
@property (nonatomic, weak, nullable) IBOutlet UITableView *tableView;
@property (nonatomic, readonly, strong, nonnull) DGForm *form;
@property (nonatomic, readonly, strong, nonnull) __kindof DGFormDataSource *formDataSource;
@property (nonatomic, readonly, strong, nonnull) __kindof DGFormEstimatedHeightDelegate *formDelegate;
/**
 Call this method after assign a tableView (not nil) and add it to a superview,
 */
- (void)configureTableView;
@end

/**
 This class override the `- configureEstimatedHeightTableView` method, no estimate.
 */
@interface DGFormViewController : DGFormEstimatedHeightViewController

@end

NS_ASSUME_NONNULL_END
