//
//  TableViewCell.m
//  DGForm
//
//  Created by Daniate on 2017/9/26.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - DGFormUpdating
- (void)dg_form_updateWithData:(id)data {
    if ([data isKindOfClass:[DGFormCellModel class]]) {
        self.textLabel.text = [(DGFormCellModel *)data text];
    }
}

@end
