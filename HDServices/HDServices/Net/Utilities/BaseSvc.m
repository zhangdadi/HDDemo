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


#pragma mark - 重写协议

+ (instancetype)getUrl:(NSString *)url {
    BaseSvc *svc = [[BaseSvc alloc] init];
    svc.help = [DBHelper getUrl:url];
    return svc;
}

+ (instancetype)postUrl:(NSString *)url {
    BaseSvc *svc = [[BaseSvc alloc] init];
    svc.help = [DBHelper postUrl:url];
    return svc;
}

- (DBHelper<DBHelperProtocol> *(^)(BaseJSONParam*))param {
    return ^id(BaseJSONParam *param) {
        _help.param(param);
        return self;
    };
}

- (DBHelper<DBHelperProtocol> *(^)(NSString*))apiVersion {
    return ^id(NSString *apiVersion) {
        _help.apiVersion(apiVersion);
        return self;
    };
}

- (DBHelper<DBHelperProtocol> *(^)(BOOL))refresh {
    return ^id(BOOL refresh) {
        _help.refresh(refresh);
        return self;
    };
}

- (DBHelper<DBHelperProtocol> *(^)(DBHelperCompletionBlock))completionBlock {
    return ^id(DBHelperCompletionBlock completionBlock) {
        _help.completionBlock(completionBlock);
        return self;
    };
}

- (id (^)())start {
    return ^id() {
        _help.start();
        return self;
    };
}


@end
