//
//  DemoSvc.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HDServices/HDServices.h>

@interface DemoSvc : BaseSvc

+ (instancetype)getDateWithParam:(DemoParam *)param cmpleted:(void(^)(APIResult *result, DemoModel *model))completed;

@end
