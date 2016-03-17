//
//  HDSystemInfo.m
//  HDCore
//
//  Created by zhangdadi on 15/6/12.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "HDSystemInfo.h"
#import <UIKit/UIKit.h>
#import "NSString+HDCore.h"

@implementation HDSystemInfo

// APP名称
+(NSString*)getAppName
{
    return [self getBundleValueByKey:@"CFBundleDisplayName"];
}

// 内部版本标识
+(NSString*)getAppVersionBuild
{
    return [self getBundleValueByKey:@"CFBundleVersion"];
}

// 发布版本号
+(NSString*)getAppVersionName
{
    return [self getBundleValueByKey:@"CFBundleShortVersionString"];
}

// 设备名称
+(NSString*)getDeviceName
{
    return [[UIDevice currentDevice] name];
}

// 系统名称
+(NSString*)getSystemName
{
    return [[UIDevice currentDevice] systemName];
}

// 系统版本
+(NSString*)getSystemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

// 手机型号
+(NSString*)getDeviceModel
{
    return [[UIDevice currentDevice] model];
}

// 手机序列号
+(NSString*)getDeviceUID
{
    NSString* str = @"";
//    NSString *deviceToken =  [[NSUserDefaults standardUserDefaults] objectForKey:KEY_DeviceToken];
//    if (![NSString isNullOrEmpty:deviceToken]) {
//        str =deviceToken;
//    }
    return str;
}

+(NSString*)getBundleValueByKey:(NSString*) name
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:name];
}

@end
