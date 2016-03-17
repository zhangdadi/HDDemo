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

@class DBHelper;
typedef void (^DBHelperCompletionBlock)(APIResult *result);


@protocol DBHelperAttribute <NSObject>

/**
 *  参数
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperAttribute> *(^params)(NSDictionary *params);

/**
 *  api版本
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperAttribute> *(^apiVersion)(NSString *apiVersion);

/**
 *  是否缓存
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperAttribute> *(^refresh)(BOOL refresh);

/**
 *  回调
 */
@property (nonatomic, copy, readonly) DBHelper<DBHelperAttribute> *(^completionBlock)(DBHelperCompletionBlock completed);

/**
 *  开始
 */
@property (nonatomic, copy, readonly) id (^start)();

@end


@interface DBHelper : NSObject<DBHelperAttribute>

#pragma mark - 子类自定义时重写

//设置url前缀
+ (NSURL *)getBaseURL;
//设置http请求的头部
+ (NSDictionary *)getHttpHeadDicta;

#pragma mark ---

+ (instancetype)getUrl:(NSString *)url;
+ (instancetype)postUrl:(NSString *)url;

// ------加载数据（自动管理缓存）-----------------------------------------------------------

//+ (void)getData:(NSString *)url
//     completed:(void (^)(APIResult *result))completed;
//
//+ (void)getData:(NSString *)url
//        params:(NSDictionary*) params
//     completed:(void (^)(APIResult *result))completed;
//
//+ (void)getData:(NSString *)url
//     apiVersion:(NSString*)apiVersion
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getData:(NSString *)url
//     apiVersion:(NSString*)apiVersion
//         params:(NSDictionary*) params
//     completed:(void (^)(APIResult *result))completed;
//
//
//+ (void)getData:(NSString *)url
//      isRefresh:(BOOL)refresh
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getData:(NSString *)url
//      isRefresh:(BOOL)refresh
//         params:(NSDictionary*) params
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getData:(NSString *)url
//      isRefresh:(BOOL)refresh
//     apiVersion:(NSString*)apiVersion
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getData:(NSString *)url
//      isRefresh:(BOOL)refresh
//     apiVersion:(NSString*)apiVersion
//         params:(NSDictionary*) params
//      completed:(void (^)(APIResult *result))completed;


// -----提交数据----------------------------------------------------

//+ (void)postData:(NSString *)url
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)postData:(NSString *)url
//         params:(NSDictionary*) params
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)postData:(NSString *)url
//     apiVersion:(NSString*)apiVersion
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)postData:(NSString *)url
//      isRefresh:(BOOL)refresh
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)postData:(NSString *)url
//         params:(NSDictionary*) params
//      isRefresh:(BOOL)refresh
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)postData:(NSString *)url
//     apiVersion:(NSString*)apiVersion
//      isRefresh:(BOOL)refresh
//      completed:(void (^)(APIResult *result))completed;
//
//// 上传文件
//+(void)uploadFile:(NSString *)url
//          fileUrl:(NSString *)fileUrl
//       apiVersion:(NSString*)apiVersion
//        completed:(void (^)(APIResult *result))completed;
//
//
//// ------加载数据（不缓存）----------------------------------------------------------------
//
//+ (void)getUnCacheData:(NSString *)url
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getUnCacheData:(NSString *)url
//         params:(NSDictionary*) params
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getUnCacheData:(NSString *)url
//     apiVersion:(NSString*)apiVersion
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getUnCacheData:(NSString *)url
//      isRefresh:(BOOL)refresh
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getUnCacheData:(NSString *)url
//      isRefresh:(BOOL)refresh
//         params:(NSDictionary*) params
//      completed:(void (^)(APIResult *result))completed;
//
//+ (void)getUnCacheData:(NSString *)url
//      isRefresh:(BOOL)refresh
//     apiVersion:(NSString*)apiVersion
//      completed:(void (^)(APIResult *result))completed;


@end
