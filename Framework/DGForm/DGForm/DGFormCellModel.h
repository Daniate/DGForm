//
//  DGFormCellModel.h
//  DGForm
//
//  Created by Daniate on 2018/5/9.
//  Copyright © 2018年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGFormCellModel : NSObject
@property (nonatomic, nullable, strong) UIImage *image;
@property (nonatomic, nullable, copy) NSString *imageURLString;
@property (nonatomic, nullable, copy) NSString *text;
@property (nonatomic, nullable, copy) NSString *detailText;
@property (nonatomic, nullable, strong) id additional;
@property (nonatomic, nullable, copy) void (^actionBlock)(id _Nullable sender);
/**
 You can connect this method to cell's UIControls or UIGestureRecognizers.
 
 Or perform it manually.
 
 It will call `actionBlock` above if assigned.

 @param sender UIControl or UIGestureRecognizer
 */
- (IBAction)triggerAction:(nullable id)sender;
@end
