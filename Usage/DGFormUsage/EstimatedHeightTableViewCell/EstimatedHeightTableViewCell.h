//
//  EstimatedHeightTableViewCell.h
//  DGForm
//
//  Created by Daniate on 2017/9/26.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <DGForm/DGForm.h>

@interface EstimatedHeightTableViewCell : UITableViewCell <DGFormUpdating>
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@property (nonatomic, copy) NSURLSessionDataTask *imgDataTask;
@end
