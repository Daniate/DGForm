//
//  DGFormDataSource.m
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGFormDataSource.h"
#import "DGFormProtocols.h"

@interface DGFormDataSource ()
@property (nonatomic, strong) DGForm *form;
@end

@implementation DGFormDataSource

- (instancetype)initWithForm:(DGForm *)form {
    if (self = [super init]) {
        _form = form;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (NSInteger)self.form.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < self.form.sections.count) {
        return (NSInteger)self.form.sections[section].rows.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DGFormRow *row = [self.form rowModelForIndexPath:indexPath];
    UITableViewCell<DGFormUpdating> *cell = [tableView dequeueReusableCellWithIdentifier:row.cellReuseIdentifier forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(dg_form_updateWithData:)]) {
        [cell dg_form_updateWithData:row.data];
    }
    if ([self.dataSource respondsToSelector:@selector(dg_form_tableView:cell:row:indexPath:)]) {
        [self.dataSource dg_form_tableView:tableView cell:cell row:row indexPath:indexPath];
    }
    return cell;
}

@end
