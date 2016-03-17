//
//  DemoSvc.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HDServices/APIResult.h>
#import <HDServices/HDServices.h>


@interface DemoSvc : NSObject

//+ (void)getDemoWithCompleted:(void (^)(APIResult *result, DemoModel *model))completed;

//+ (void)postDemo:(DemoModel *)mo;

+ (instancetype)getDateWithCOmpleted:(void(^)(APIResult *result, NSString *model))completed;

@end
