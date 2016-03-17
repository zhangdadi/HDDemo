//
//  DBHelper.m
//  HDServices
//
//  Created by zhangdadi on 15/4/1.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "DBHelper.h"
#import "AFNetworking.h"
#import "APIResult_Net.h"

@interface DBHelper ()
{
    NSDictionary *_params;
    NSString *_apiVersion;
    BOOL _refresh;
    DBHelperCompletionBlock _completionBlock;
}

@property (nonatomic, strong) NSString *url;

@end

@implementation DBHelper

- (instancetype)init {
    self = [super init];
    if (self) {
        _apiVersion = @"1";
    }
    return self;
}

+ (instancetype)getUrl:(NSString *)url {
    DBHelper *helper = [[DBHelper alloc] init];
    helper.url = url;
    return helper;
}

+ (instancetype)postUrl:(NSString *)url {
    DBHelper *helper = [[DBHelper alloc] init];
    helper.url = url;
    return helper;
}

- (DBHelper<DBHelperAttribute> *(^)(NSDictionary*))params {
    return ^id(NSDictionary *params) {
        _params = params;
        return self;
    };
}

- (DBHelper<DBHelperAttribute> *(^)(NSString*))apiVersion {
    return ^id(NSString *apiVersion) {
        _apiVersion = apiVersion;
        return self;
    };
}

- (DBHelper<DBHelperAttribute> *(^)(BOOL))refresh {
    return ^id(BOOL refresh) {
        _refresh = refresh;
        return self;
    };
}

- (DBHelper<DBHelperAttribute> *(^)(DBHelperCompletionBlock))completionBlock {
    return ^id(DBHelperCompletionBlock completionBlock) {
        _completionBlock = [completionBlock copy];
        return self;
    };
}

- (id (^)())start {
    return ^id() {
        [DBHelper getData:_url isRefresh:_refresh apiVersion:_apiVersion params:_params completed:_completionBlock];
        return nil;
    };
}

+ (void)getData:(NSString *)url
      isRefresh:(BOOL)refresh
     apiVersion:(NSString*)apiVersion
         params:(NSDictionary*) params
      completed:(void (^)(APIResult *result))completed {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self getBaseURL]];
//    [self setHttpFildWithManager:manager];

    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        APIResult *result = [[APIResult alloc] init];
        result.data = responseObject;
        if (completed) {
            completed(result);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求不通");
    }];
    
}


+ (void)postData:(NSString *)url params:(NSDictionary *)params completed:(void (^)(APIResult *))completed {
    AFHTTPSessionManager *ma = [AFHTTPSessionManager manager];
    ma.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];//设置相应内容类型

    [ma POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - 私有方法

+ (NSURL *)getBaseURL {
    return [NSURL URLWithString:@"http://apitest.aidianhui.com"];
}

+ (NSDictionary *)getHttpHeadDicta {
    NSDictionary *dict = @{};
    
    return nil;

}



@end
