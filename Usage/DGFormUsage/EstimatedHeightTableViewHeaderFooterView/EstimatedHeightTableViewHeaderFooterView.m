//
//  EstimatedHeightTableViewHeaderFooterView.m
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "EstimatedHeightTableViewHeaderFooterView.h"

@implementation EstimatedHeightTableViewHeaderFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.mainLabel.text = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
