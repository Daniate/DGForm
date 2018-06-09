//
//  DGFormProtocols.h
//  DGForm
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DGFormRow;
@class DGFormSection;

@protocol DGFormDataSource <NSObject>
@optional
- (void)dg_form_tableView:(UITableView *)tableView
                     cell:(UITableViewCell *)cell
                      row:(DGFormRow *)row
                indexPath:(NSIndexPath *)indexPath;
@end

@protocol DGFormDelegate <NSObject>
@optional
- (void)dg_form_tableView:(UITableView *)tableView
          willDisplayCell:(UITableViewCell *)cell
                      row:(DGFormRow *)row
                indexPath:(NSIndexPath *)indexPath;
- (void)dg_form_tableView:(UITableView *)tableView
    willDisplayHeaderView:(UIView *)headerView
                   header:(DGFormSectionHeaderFooter *)header
                  section:(NSInteger)section;
- (void)dg_form_tableView:(UITableView *)tableView
    willDisplayFooterView:(UIView *)footerView
                   footer:(DGFormSectionHeaderFooter *)footer
                  section:(NSInteger)section;
// Called after the user changes the selection.
- (void)dg_form_tableView:(UITableView *)tableView
             didSelectRow:(DGFormRow *)row
                indexPath:(NSIndexPath *)indexPath;
- (void)dg_form_tableView:(UITableView *)tableView
           didDeselectRow:(DGFormRow *)row
                indexPath:(NSIndexPath *)indexPath;
// Configure header or footer view
- (void)dg_form_tableView:(UITableView *)tableView
               headerView:(UIView * _Nullable)headerView
                   header:(DGFormSectionHeaderFooter *)header
                  section:(NSInteger)section;
- (void)dg_form_tableView:(UITableView *)tableView
               footerView:(UIView * _Nullable)footerView
                   footer:(DGFormSectionHeaderFooter *)footer
                  section:(NSInteger)section;
@end

/**
 Your custom table view cells/section headers/section footers can confirm this protocol
 */
@protocol DGFormUpdating <NSObject>
@optional
- (void)dg_form_updateWithData:(id _Nullable)data;
@end

NS_ASSUME_NONNULL_END
