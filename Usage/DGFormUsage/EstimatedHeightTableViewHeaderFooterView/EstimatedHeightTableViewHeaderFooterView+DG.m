//
//  EstimatedHeightTableViewHeaderFooterView+DG.m
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "EstimatedHeightTableViewHeaderFooterView+DG.h"

@implementation EstimatedHeightTableViewHeaderFooterView (DG)

#pragma mark - DGFormUpdating
- (void)dg_form_updateWithData:(id)data {
    if ([data isKindOfClass:[NSString class]]) {
        self.mainLabel.text = (NSString *)data;
    }
}

@end
