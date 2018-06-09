//
//  EstimatedHeightTableViewHeaderFooterView.h
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <DGForm/DGForm.h>

@interface EstimatedHeightTableViewHeaderFooterView : UITableViewHeaderFooterView <DGFormUpdating>
@property (nonatomic, weak) IBOutlet UILabel *mainLabel;
@end
