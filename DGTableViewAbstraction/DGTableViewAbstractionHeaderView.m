//
//  DGTableViewAbstractionHeaderView.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/8/25.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "DGTableViewAbstractionHeaderView.h"

@implementation DGTableViewAbstractionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self _init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self _init];
}

#pragma mark - Public
- (void)toggleOpenWithUserAction:(BOOL)userAction {
    // toggle the disclosure button state
    self.disclosureButton.selected = !self.disclosureButton.selected;
    // if this was a user action, send the delegate the appropriate message
    if (userAction) {
        if (self.disclosureButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:willOpen:)]) {
                [self.delegate sectionHeaderView:self willOpen:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:willClose:)]) {
                [self.delegate sectionHeaderView:self willClose:self.section];
            }
        }
    }
}
#pragma mark - Private
- (void)_init {
    UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [disclosureButton addTarget:self action:@selector(_toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:disclosureButton];
    _disclosureButton = disclosureButton;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_toggleOpen:)];
    [self.contentView addGestureRecognizer:tap];
}

- (void)_toggleOpen:(id)sender {
    [self toggleOpenWithUserAction:YES];
}

@end
