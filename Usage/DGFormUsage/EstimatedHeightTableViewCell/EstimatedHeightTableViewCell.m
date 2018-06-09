//
//  EstimatedHeightTableViewCell.m
//  DGForm
//
//  Created by Daniate on 2017/9/26.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "EstimatedHeightTableViewCell.h"

@interface EstimatedHeightTableViewCell ()

@end

@implementation EstimatedHeightTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    [self.imgDataTask cancel];
    
    self.imgView.image = nil;
    self.nameLabel.text = nil;
    self.descriptionLabel.text = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
