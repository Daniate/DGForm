//
//  FooterView.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/7/21.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.textLabel.text = @"This is section footer.";
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.textLabel.text = @"This is section footer.";
    self.textLabel.textAlignment = NSTextAlignmentCenter;
}

@end
