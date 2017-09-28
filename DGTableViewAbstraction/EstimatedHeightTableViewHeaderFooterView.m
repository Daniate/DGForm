//
//  EstimatedHeightTableViewHeaderFooterView.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "EstimatedHeightTableViewHeaderFooterView.h"

@implementation EstimatedHeightTableViewHeaderFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
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
