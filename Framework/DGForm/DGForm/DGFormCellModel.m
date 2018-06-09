//
//  DGFormCellModel.m
//  DGForm
//
//  Created by Daniate on 2018/5/9.
//  Copyright © 2018年 Daniate. All rights reserved.
//

#import "DGFormCellModel.h"

@implementation DGFormCellModel
- (IBAction)triggerAction:(nullable id)sender {
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}
@end
