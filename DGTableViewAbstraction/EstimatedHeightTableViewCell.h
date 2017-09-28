//
//  EstimatedHeightTableViewCell.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/26.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstraction.h"

@interface EstimatedHeightTableViewCell : UITableViewCell <DGTableViewAbstractionCellUpdating>
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@property (nonatomic, copy) NSURLSessionDataTask *imgDataTask;
@end
