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

+ (instancetype)getDateWithParam:(DemoParam *)param cmpleted:(void(^)(APIResult *result, DemoModel *model))completed {
    
    DemoSvc *svc = [[DemoSvc alloc] init];
    
    (svc.help = [DBHelper getUrl:@"api/nodes/show.json"]).param(param).refresh(YES).completionBlock(^(APIResult *result){
        DemoModel *model = [DemoModel parse:result.data];
        completed(result, model);
    }).start();

    return svc;
}

@end
