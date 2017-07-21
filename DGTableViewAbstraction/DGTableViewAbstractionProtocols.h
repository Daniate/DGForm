//
//  DGTableViewAbstractionProtocols.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DGTableViewAbstractionRowModel;

@protocol DGTableViewAbstractionDelegate <UITableViewDelegate>
@optional
// Called after the user changes the selection.
- (void)dg_tableView:(UITableView * _Nonnull)tableView didSelectRowModel:(DGTableViewAbstractionRowModel * _Nonnull)rowModel;
- (void)dg_tableView:(UITableView * _Nonnull)tableView didDeselectRowModel:(DGTableViewAbstractionRowModel * _Nonnull)rowModel;
@end

/**
 Your custom table view cells can confirm this protocol
 */
@protocol DGTableViewAbstractionCellUpdating <NSObject>
@optional
- (void)dg_updateCellWithData:(id _Nullable)data;
@end

/**
 Your custom table view header/footer views can confirm this protocol
 */
@protocol DGTableViewAbstractionHeaderFooterUpdating <NSObject>
@optional
- (void)dg_updateHeaderFooterWithData:(id _Nullable)data;
@end
