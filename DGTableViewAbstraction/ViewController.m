//
//  ViewController.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "ViewController.h"
#import "DGTableViewAbstraction.h"
#import "TableViewCell.h"
#import "TableViewController.h"
#import "TableViewControllerWithEstimatedHeight.h"
#import "ViewControllerWithEstimatedHeight.h"

@interface ViewController () <DGTableViewAbstractionDelegate>
@property (nonatomic, copy) NSArray<NSString *> *titleList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self configureEstimatedHeightTableView];
    self.tableViewDelegate.delegate = self;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    
    [self.tableViewModel.sections removeAllObjects];
    NSArray<NSString *> *titleList = @[
                                       @"DGTableViewControllerWithTableViewAbstraction",
                                       @"DGTableViewControllerWithEstimatedHeightTableViewAbstraction",
                                       @"DGViewControllerWithEstimatedHeightTableViewAbstraction",
                                       ];
    
    Class headerFooterClass = [UITableViewHeaderFooterView class];
    DGTableViewAbstractionSectionModel *sectionModel = [[DGTableViewAbstractionSectionModel alloc] initWithHeaderClass:headerFooterClass footerClass:headerFooterClass];
    for (NSUInteger i = 0; i < titleList.count; i++) {
        DGTableViewAbstractionRowModel *rowModel = [[DGTableViewAbstractionRowModel alloc] initWithCellClass:[TableViewCell class]];
        rowModel.cellHeight = 44;
        rowModel.data = titleList[i];
        [sectionModel.rows addObject:rowModel];
    }
    [self.tableViewModel.sections addObject:sectionModel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSArray<NSIndexPath *> *selectedRows = [self.tableView indexPathsForSelectedRows];
    for (NSIndexPath *indexPath in selectedRows) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DGTableViewAbstractionDelegate
- (void)dg_tableView:(UITableView *)tableView didSelectRowModel:(DGTableViewAbstractionRowModel *)rowModel atIndexPath:(NSIndexPath * _Nonnull)indexPath {
    if ([rowModel.data isKindOfClass:[NSString class]]) {
        if ([rowModel.data isEqualToString:@"DGTableViewControllerWithTableViewAbstraction"]) {
            TableViewController *vc = [[TableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([rowModel.data isEqualToString:@"DGTableViewControllerWithEstimatedHeightTableViewAbstraction"]) {
            TableViewControllerWithEstimatedHeight *vc = [[TableViewControllerWithEstimatedHeight alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if ([rowModel.data isEqualToString:@"DGViewControllerWithEstimatedHeightTableViewAbstraction"]) {
            ViewControllerWithEstimatedHeight *vc = [[ViewControllerWithEstimatedHeight alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
