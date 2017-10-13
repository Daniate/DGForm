//
//  DGTableViewAbstractionProtocols.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DGTableViewAbstractionRowModel;
@class DGTableViewSectionHeaderFooterModel;

@protocol DGTableViewAbstractionDataSource <NSObject>
@optional
- (void)dg_tableView:(UITableView *)tableView
                cell:(UITableViewCell *)cell
            rowModel:(DGTableViewAbstractionRowModel *)rowModel
         atIndexPath:(NSIndexPath *)indexPath;
@end

@protocol DGTableViewAbstractionDelegate <NSObject>
@optional
// Called after the user changes the selection.
- (void)dg_tableView:(UITableView *)tableView
   didSelectRowModel:(DGTableViewAbstractionRowModel *)rowModel
         atIndexPath:(NSIndexPath *)indexPath;
- (void)dg_tableView:(UITableView *)tableView
 didDeselectRowModel:(DGTableViewAbstractionRowModel *)rowModel
         atIndexPath:(NSIndexPath *)indexPath;
- (void)dg_tableView:(UITableView *)tableView
          headerView:(UIView * _Nullable)headerView
         headerModel:(DGTableViewSectionHeaderFooterModel *)headerModel
           inSection:(NSInteger)section;
- (void)dg_tableView:(UITableView *)tableView
          footerView:(UIView * _Nullable)footerView
         footerModel:(DGTableViewSectionHeaderFooterModel *)footerModel
           inSection:(NSInteger)section;
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

/**
 Your custom table view header views can confirm this protocol.
 
 Protocol to be adopted by the section header's delegate.
 
 The section header tells its delegate when the section should be opened and closed.
 */
@protocol DGTableViewAbstractionHeaderViewDelegate <NSObject>
@optional
/**
 Before row insertion/deletion/reloading.
 
 @param sectionHeaderView may be a UITableViewHeaderFooterView object
 @param section section index
 */
- (void)sectionHeaderView:(__kindof UIView *)sectionHeaderView willOpen:(NSInteger)section;
/**
 Before row insertion/deletion/reloading.
 
 @param sectionHeaderView may be a UITableViewHeaderFooterView object
 @param section section index
 */
- (void)sectionHeaderView:(__kindof UIView *)sectionHeaderView willClose:(NSInteger)section;
@end

NS_ASSUME_NONNULL_END
