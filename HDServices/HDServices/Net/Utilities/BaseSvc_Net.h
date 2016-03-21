//
//  BaseSvc_Net.h
//  HDServices
//
//  Created by zhangdadi on 15/6/30.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#ifndef HDServices_BaseSvc_Net_h
#define HDServices_BaseSvc_Net_h

#import "BaseSvc.h"
#import "DBHelper.h"

@interface BaseSvc ()<DBHelperProtocol>

@property (nonatomic, strong) DBHelper *help;



@end

#endif
