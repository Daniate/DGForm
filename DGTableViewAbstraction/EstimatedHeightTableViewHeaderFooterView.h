//
//  EstimatedHeightTableViewHeaderFooterView.h
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGTableViewAbstraction.h"

#define kText @"访华期间，蒂勒森将会晤中国高层领导人并讨论一系列问题，其中包括美国总统特朗普年底前访华、贸易和投资、朝鲜半岛无核化问题等。这也将是蒂勒森就任国务卿9个月以来第二次访华。在美国媒体看来，尽管蒂勒森此次中国行直到动身几天前才对外界宣布，但“访华清单”上的三大议题，每一个分量都不轻。"

@interface EstimatedHeightTableViewHeaderFooterView : UITableViewHeaderFooterView <DGTableViewAbstractionHeaderFooterUpdating>
@property (nonatomic, weak) IBOutlet UILabel *mainLabel;
@end
