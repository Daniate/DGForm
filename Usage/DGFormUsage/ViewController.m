//
//  ViewController.m
//  DGForm
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "ViewController.h"
#import <DGForm/DGForm.h>
#import "TableViewCell.h"
#import "EHViewController.h"

@interface ViewController () <DGFormDelegate>
@property (nonatomic, copy) NSArray<NSString *> *titleList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self configureTableView];
    self.formDelegate.delegate = self;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    
    [self configDataSource];
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

- (void)configDataSource {
    NSArray<NSString *> *titleList = @[
                                       @"ViewController(Estimated Height Cell)",
                                       ];
    
    [self.form.sections removeAllObjects];
    DGFormSection *sectionModel = [DGFormSection new];
    for (NSUInteger i = 0; i < titleList.count; i++) {
        DGFormRow *rowModel = [[DGFormRow alloc] initWithCellClass:[TableViewCell class]];
        
        DGFormCellModel *data = [DGFormCellModel new];
        data.text = titleList[i];
        data.actionBlock = ^(id sender) {
            UIViewController *vc = nil;
            if (0 == i) {
                vc = [[EHViewController alloc] init];
            }
            if (vc) {
                [self.navigationController pushViewController:vc animated:YES];
            }
        };
        
        rowModel.data = data;
        [sectionModel.rows addObject:rowModel];
        
        NSLog(@"%@", rowModel);
    }
    [self.form.sections addObject:sectionModel];
    
    NSLog(@"%@", sectionModel);
    
    NSLog(@"%@", self.form);
}

#pragma mark - DGFormDelegate <NSObject>
// Called after the user changes the selection.
- (void)dg_form_tableView:(UITableView *)tableView
             didSelectRow:(DGFormRow *)row
                indexPath:(NSIndexPath *)indexPath {
    [(DGFormCellModel *)row.data triggerAction:nil];
}

@end
