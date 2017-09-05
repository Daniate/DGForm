//
//  DGTableViewAbstractionHeaderView.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/8/25.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstractionProtocols.h"

@interface DGTableViewAbstractionHeaderView : UITableViewHeaderFooterView
/**
 You can change its position. You should update its selected property in `-tableView:viewForHeaderInSection:`
 
 When its selected is YES, header view will open.
 
 When its selected is NO, header view will close.
 */
@property (nonatomic, strong, nonnull, readonly) UIButton *disclosureButton;
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, weak, nullable) IBOutlet id <DGTableViewAbstractionHeaderViewDelegate> delegate;

- (void)toggleOpenWithUserAction:(BOOL)userAction;
@end
