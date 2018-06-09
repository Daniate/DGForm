//
//  DGFormViewController.m
//  DGForm
//
//  Created by Daniate on 2017/7/20.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGFormViewController.h"

@implementation DGFormEstimatedHeightViewController {
    @protected
    DGForm *_form;
    __kindof DGFormDataSource *_formDataSource;
    __kindof DGFormEstimatedHeightDelegate *_formDelegate;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self _init];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureTableView {
    self.tableView.dataSource = self.formDataSource;
    self.tableView.delegate = self.formDelegate;
    
    [self.tableView dg_form_enableEstimatedHeight:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if ([@"tableView" isEqualToString:keyPath]) {
        [self configureTableView];
    }
}

#pragma mark - Private
- (void)_init {
    [self addObserver:self forKeyPath:@"tableView" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:NULL];
    
    _form = [DGForm new];
    _formDataSource = [[DGFormDataSource alloc] initWithForm:_form];
    _formDelegate = [[DGFormEstimatedHeightDelegate alloc] initWithForm:_form];
}

@end

@implementation DGFormViewController

- (void)configureTableView {
    self.tableView.dataSource = self.formDataSource;
    self.tableView.delegate = self.formDelegate;
    
    [self.tableView dg_form_enableEstimatedHeight:NO];
}

#pragma mark - Private
- (void)_init {
    _form = [DGForm new];
    _formDataSource = [[DGFormDataSource alloc] initWithForm:_form];
    _formDelegate = [[DGFormDelegate alloc] initWithForm:_form];
}

@end
