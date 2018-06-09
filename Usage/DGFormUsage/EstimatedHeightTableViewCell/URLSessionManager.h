//
//  URLSessionManager.h
//  DGForm
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLSessionManager : NSObject
@property (nonatomic, readonly, strong) NSURLSession *session;
+ (instancetype)manager;
@end
