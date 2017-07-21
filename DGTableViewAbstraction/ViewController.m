//
//  ViewController.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "ViewController.h"
#import "DGTableViewAbstraction.h"
#import "HeaderView.h"
#import "FooterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.tableViewModel.sections removeAllObjects];
    
    uint32_t outerRnd = 1 + arc4random_uniform(100);
    for (uint32_t i = 0; i < outerRnd; i++) {
        DGTableViewAbstractionSectionModel *sectionModel = [DGTableViewAbstractionSectionModel new];
        sectionModel.header.headerFooterClass = [HeaderView class];
        sectionModel.header.headerFooterHeight = 30 + arc4random_uniform(100);
        
        sectionModel.footer.headerFooterClass = [FooterView class];
        sectionModel.footer.headerFooterHeight = 30 + arc4random_uniform(100);
        
        for (uint32_t i = 0; i < 10; i++) {
            DGTableViewAbstractionRowModel *rowModel = [DGTableViewAbstractionRowModel new];
            rowModel.cellHeight = 44 + arc4random_uniform(100);
            [sectionModel.rows addObject:rowModel];
        }
        
        [self.tableViewModel.sections addObject:sectionModel];
    }
    
    [self registerClassesForTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxxxx" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)[super tableView:tableView viewForHeaderInSection:section];
    header.contentView.backgroundColor = [UIColor redColor];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)[super tableView:tableView viewForFooterInSection:section];
    footer.contentView.backgroundColor = [UIColor orangeColor];
    return footer;
}


@end
