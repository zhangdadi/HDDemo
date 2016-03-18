//
//  BaseSvc.m
//  HDServices
//
//  Created by zhangdadi on 15/6/30.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "BaseSvc.h"
#import "DBHelper_Net.h"
#import "BaseJSONPageParam.h"

@interface BaseSvc ()

@property (nonatomic, strong) DBHelper *help;

@end

@implementation BaseSvc

- (void)loadFirstPage {
    NSLog(@"loadFirstPage");
    BaseJSONParam *param = [_help getParam];
    if ([param isKindOfClass:[BaseJSONPageParam class]]) {
        ((BaseJSONPageParam *)param).pageIndex = 0;
        _help.start();
    } else{
        NSLog(@"此接口不能分页");
    }

}

- (void)loadNextPage {
    NSLog(@"loadNextPage");
    BaseJSONParam *param = [_help getParam];
    if ([param isKindOfClass:[BaseJSONPageParam class]]) {
        ((BaseJSONPageParam *)param).pageIndex++;
        _help.start();
    } else{
        NSLog(@"此接口不能分页");
    }
}

@end
