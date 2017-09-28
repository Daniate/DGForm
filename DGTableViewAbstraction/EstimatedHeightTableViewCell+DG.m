//
//  EstimatedHeightTableViewCell+DG.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/26.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "EstimatedHeightTableViewCell+DG.h"

@implementation EstimatedHeightTableViewCell (DG)

#pragma mark - DGTableViewAbstractionCellUpdating
- (void)dg_updateCellWithData:(id)data {
    if (![data isKindOfClass:[Picture class]]) {
        return;
    }
    Picture *t = (Picture *)data;
    self.nameLabel.text = t.name;
    self.descriptionLabel.text = t.detailDesc;
    if (!t.URLString) {
        return;
    }
    NSURL *URL = [NSURL URLWithString:t.URLString];
    if (!URL) {
        return;
    }
    self.imgDataTask = [[URLSessionManager manager].session
                        dataTaskWithURL:URL
                        completionHandler:^(NSData * _Nullable data,
                                            NSURLResponse * _Nullable response,
                                            NSError * _Nullable error)
    {
        if (error) {
            return;
        }
        if (data.length == 0) {
            return;
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.imgView.image = [UIImage imageWithData:data];
        });
    }];
    [self.imgDataTask resume];
}
@end
