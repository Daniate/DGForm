//
//  EstimatedHeightTableViewHeaderFooterView+DG.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "EstimatedHeightTableViewHeaderFooterView+DG.h"

@implementation EstimatedHeightTableViewHeaderFooterView (DG)
#pragma mark - DGTableViewAbstractionHeaderFooterUpdating
- (void)dg_updateHeaderFooterWithData:(id)data {
    if ([data isKindOfClass:[NSString class]]) {
        self.mainLabel.text = (NSString *)data;
    }
}
@end
