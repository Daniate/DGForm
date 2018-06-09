//
//  ViewControllerWithEstimatedHeight.m
//  DGForm
//
//  Created by Daniate on 2017/9/26.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "EHViewController.h"
#import "EstimatedHeightTableViewCell+DG.h"
#import "EstimatedHeightTableViewHeaderFooterView.h"
#import "Header.h"

@interface EHViewController () <DGFormDelegate>

@end

@implementation EHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerNib:[UINib nibWithNibName:@"EstimatedHeightTableViewHeaderFooterView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"EstimatedHeightTableViewHeaderFooterView"];
    [tableView registerNib:[UINib nibWithNibName:@"EstimatedHeightTableViewCell" bundle:nil] forCellReuseIdentifier:@"EstimatedHeightTableViewCell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self configureTableView];
    self.tableView.estimatedSectionHeaderHeight = 320;
    self.formDelegate.delegate = self;
    
    [self.form.sections removeAllObjects];
    
    uint32_t numberOfSections = 1 + arc4random_uniform(100);
    
    Class headerFooterClass = [EstimatedHeightTableViewHeaderFooterView class];
    for (uint32_t i = 0; i < numberOfSections; i++) {
        DGFormSection *section = [[DGFormSection alloc] initWithHeaderClass:headerFooterClass footerClass:headerFooterClass];
        
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
                                               @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=391524337,2032411834&fm=27&gp=0.jpg",
                                               @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=315767308,854214950&fm=27&gp=0.jpg",
                                               @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4279261434,522437038&fm=27&gp=0.jpg",
                                               @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1174366886,2028537157&fm=27&gp=0.jpg",
                                               @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2398569165,148239322&fm=27&gp=0.jpg",
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
            
            DGFormRow *row = [[DGFormRow alloc] initWithCellClass:[EstimatedHeightTableViewCell class]];
            row.data = p;
            [section.rows addObject:row];
        }
        
        [self.form.sections addObject:section];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DGFormDelegate <NSObject>
- (void)dg_form_tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell row:(DGFormRow *)row indexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[EstimatedHeightTableViewCell class]]) {
        EstimatedHeightTableViewCell *zell = (EstimatedHeightTableViewCell *)cell;
        [zell.imgDataTask resume];
    }
}

@end
