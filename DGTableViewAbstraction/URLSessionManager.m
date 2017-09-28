//
//  URLSessionManager.m
//  DGTableViewAbstraction
//
//  Created by Daniate on 2017/9/28.
//  Copyright © 2017年 Daniate. All rights reserved.
//

#import "URLSessionManager.h"

@implementation URLSessionManager

static URLSessionManager *_manager = nil;

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[super allocWithZone:NULL] init];
    });
    return _manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self manager];
}

- (instancetype)init {
    if (self = [super init]) {
        NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
        cfg.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;
        cfg.timeoutIntervalForRequest = 30;
        cfg.timeoutIntervalForResource = 30;
        _session = [NSURLSession sessionWithConfiguration:cfg];
    }
    return self;
}

@end
