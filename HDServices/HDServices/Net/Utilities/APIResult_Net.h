//
//  APIResult_Net.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "APIResult.h"

typedef NS_ENUM(int, APIResultType) {
    /**
     *  成功
     */
    APIResultType_OK = 0,
    /**
     *  失败
     */
    APIResultType_Failed,
};



@interface APIResult ()

@property (nonatomic, assign) APIResultType  code;
@property (nonatomic, strong) id    data;

+ (instancetype)parse:(NSDictionary*)jsonData;


@end
