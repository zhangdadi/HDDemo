//
//  DemoSvc.m
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "DemoSvc.h"
#import "DBHelper.h"
#import "APIResult_Net.h"


@implementation DemoSvc

+ (instancetype)getDateWithCOmpleted:(void(^)(APIResult *result, NSString *model))completed {
    
    [DBHelper getUrl:@"api/city/GetEnableCities"].refresh(NO).completionBlock(^(APIResult *result){
        NSLog(@"11");
        DemoModel *model = [DemoModel parse:result.data];
        completed(result, nil);
    }).start();
    
    return nil;
}

@end
