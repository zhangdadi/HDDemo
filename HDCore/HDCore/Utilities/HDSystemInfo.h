//
//  HDSystemInfo.h
//  HDCore
//
//  Created by zhangdadi on 15/6/12.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDSystemInfo : NSObject

+ (NSString*)getAppName;
+ (NSString*)getAppVersionBuild;
+ (NSString*)getAppVersionName;
+ (NSString*)getDeviceName;
+ (NSString*)getSystemName;
+ (NSString*)getSystemVersion;
+ (NSString*)getDeviceModel;
+ (NSString*)getDeviceUID;


@end
