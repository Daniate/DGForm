//
//  TableViewControllerWithEstimatedHeight.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/26.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "TableViewControllerWithEstimatedHeight.h"
#import "EstimatedHeightTableViewCell+DG.h"
#import "EstimatedHeightTableViewHeaderFooterView.h"

@interface TableViewControllerWithEstimatedHeight () <DGTableViewAbstractionDelegate>

@end

@implementation TableViewControllerWithEstimatedHeight

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"EstimatedHeightTableViewHeaderFooterView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"EstimatedHeightTableViewHeaderFooterView"];
    [self.tableView registerNib:[UINib nibWithNibName:@"EstimatedHeightTableViewCell" bundle:nil] forCellReuseIdentifier:@"EstimatedHeightTableViewCell"];
    self.tableView.estimatedSectionHeaderHeight = 320;
    
    self.tableViewDelegate.delegate = self;
    
    [self.tableViewModel.sections removeAllObjects];
    
    uint32_t numberOfSections = 1+ arc4random_uniform(10);
    
    for (uint32_t i = 0; i < numberOfSections; i++) {
        DGTableViewAbstractionSectionModel *section = [DGTableViewAbstractionSectionModel new];
        section.header.headerFooterClass = [EstimatedHeightTableViewHeaderFooterView class];
        section.footer.headerFooterClass = [EstimatedHeightTableViewHeaderFooterView class];
        
        uint32_t index = arc4random_uniform((uint32_t)[kText length]);
        NSString *substring = [kText substringToIndex:index];
        
        section.header.data = [NSString stringWithFormat:@"Header %u: %@", i, substring];
        
        index = arc4random_uniform((uint32_t)[kText length]);
        substring = [kText substringToIndex:index];
        
        section.footer.data = [NSString stringWithFormat:@"Footer %u: %@", i, substring];
        
        NSArray<NSString *> *URLStringList = @[
                                               @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=391524337,2032411834&fm=27&gp=0.jpg",
                                               @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=315767308,854214950&fm=27&gp=0.jpg",
                                               @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4279261434,522437038&fm=27&gp=0.jpg",
                                               @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1174366886,2028537157&fm=27&gp=0.jpg",
                                               @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2398569165,148239322&fm=27&gp=0.jpg",
                                               ];
        for (NSString *URLString in URLStringList) {
            Picture *p = [Picture new];
            p.URLString = URLString;
            NSString *desc = [[URLString dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
            p.name = desc.length > 10 ? [desc substringToIndex:10] : desc;
            p.detailDesc = [desc substringToIndex:arc4random_uniform((uint32_t)desc.length)];
            
            DGTableViewAbstractionRowModel *row = [DGTableViewAbstractionRowModel new];
            row.cellClass = [EstimatedHeightTableViewCell class];
            row.data = p;
            [section.rows addObject:row];
        }
        
        [self.tableViewModel.sections addObject:section];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - DGTableViewAbstractionDelegate
- (void)dg_tableView:(UITableView * _Nonnull)tableView headerView:(UIView * _Nullable)headerView headerModel:(DGTableViewSectionHeaderFooterModel * _Nonnull)headerModel inSection:(NSInteger)section {
    NSString *headerViewLayoutMargins = NSStringFromUIEdgeInsets(headerView.layoutMargins);
    NSLog(@"headerViewLayoutMargins: %@", headerViewLayoutMargins);
}
- (void)dg_tableView:(UITableView * _Nonnull)tableView footerView:(UIView * _Nullable)footerView footerModel:(DGTableViewSectionHeaderFooterModel * _Nonnull)footerModel inSection:(NSInteger)section {
    NSString *footerViewLayoutMargins = NSStringFromUIEdgeInsets(footerView.layoutMargins);
    NSLog(@"footerViewLayoutMargins: %@", footerViewLayoutMargins);
}

@end
