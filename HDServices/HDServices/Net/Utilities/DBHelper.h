//
//  DBHelper.h
//  HDServices
//
//  Created by zhangdadi on 15/4/1.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIResult.h"
#import "APIResult_Net.h"
#import "BaseJSONParam.h"

@class DBHelper;
typedef void (^DBHelperCompletionBlock)(APIResult *result);


@protocol DBHelperProtocol  <NSObject>

+ (instancetype)getUrl:(NSString *)url;
+ (instancetype)postUrl:(NSString *)url;

/**
 *  参数
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperProtocol> *(^param)(BaseJSONParam *param);

/**
 *  api版本
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperProtocol> *(^apiVersion)(NSString *apiVersion);

/**
 *  是否缓存
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperProtocol> *(^refresh)(BOOL refresh);

/**
 *  回调
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperProtocol> *(^completionBlock)(DBHelperCompletionBlock completed);

/**
 *  开始
 */
@property (nonatomic, copy, readonly) id (^start)();

@end


@interface DBHelper : NSObject<DBHelperProtocol>

#pragma mark - 子类自定义时重写

//设置url前缀
+ (NSURL *)getBaseURL;
//设置http请求的头部
+ (NSDictionary *)getHttpHeadDicta;

#pragma mark ---


@end
