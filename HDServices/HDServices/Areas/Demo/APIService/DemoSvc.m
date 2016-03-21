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
#import "BaseSvc_Net.h"


@implementation DemoSvc

+ (instancetype)getDataWithParam:(DemoParam *)param cmpleted:(void(^)(APIResult *result, DemoModel *model))completed {
    
    return [BaseSvc getUrl:@"api/nodes/show.json"].param(param).refresh(YES).completionBlock(^(APIResult *result){
        DemoModel *model = [DemoModel parse:result.data];
        completed(result, model);
    }).start();
    
}

@end
