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

//请求类型
typedef NS_ENUM(int, HttpType) {
    HttpTypeGet = 0,
    HttpTypePost
};


@interface DBHelper ()
{
    BaseJSONParam *_param;
    NSString *_apiVersion;
    BOOL _refresh;
    DBHelperCompletionBlock _completionBlock;
}

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) HttpType httpType;


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
    helper.httpType = HttpTypeGet;
    return helper;
}

+ (instancetype)postUrl:(NSString *)url {
    DBHelper *helper = [[DBHelper alloc] init];
    helper.url = url;
    helper.httpType = HttpTypePost;
    return helper;
}

- (DBHelper<DBHelperProtocol> *(^)(BaseJSONParam*))param {
    return ^id(BaseJSONParam *param) {
        _param = param;
        return self;
    };
}

- (DBHelper<DBHelperProtocol> *(^)(NSString*))apiVersion {
    return ^id(NSString *apiVersion) {
        _apiVersion = apiVersion;
        return self;
    };
}

- (DBHelper<DBHelperProtocol> *(^)(BOOL))refresh {
    return ^id(BOOL refresh) {
        _refresh = refresh;
        return self;
    };
}

- (DBHelper<DBHelperProtocol> *(^)(DBHelperCompletionBlock))completionBlock {
    return ^id(DBHelperCompletionBlock completionBlock) {
        _completionBlock = [completionBlock copy];
        return self;
    };
}

- (id (^)())start {
    return ^id() {
        switch (_httpType) {
            case HttpTypeGet:
                [DBHelper getData:_url isRefresh:_refresh apiVersion:_apiVersion params:[_param toDictionary] completed:_completionBlock];
                break;
            case HttpTypePost:
                [DBHelper postData:_url apiVersion:_apiVersion params:[_param toDictionary] completed:_completionBlock];
                break;
                
            default:
                break;
        }
        return nil;
    };
}

+ (void)getData:(NSString *)url
      isRefresh:(BOOL)refresh
     apiVersion:(NSString*)apiVersion
         params:(NSDictionary*) params
      completed:(void (^)(APIResult *result))completed {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self getBaseURL]];

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

+ (void)postData:(NSString *)url
     apiVersion:(NSString*)apiVersion
         params:(NSDictionary*) params
      completed:(void (^)(APIResult *result))completed {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self getBaseURL]];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        APIResult *result = [[APIResult alloc] init];
        result.data = responseObject;
        if (completed) {
            completed(result);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求不通");
    }];
    
}

#pragma mark - 私有方法

+ (NSURL *)getBaseURL {
    return [NSURL URLWithString:@"http://www.v2ex.com/"];
}

+ (NSDictionary *)getHttpHeadDicta {
    
    return nil;

}

#pragma mark -

- (BaseJSONParam *)getParam {
    return _param;
}

@end
