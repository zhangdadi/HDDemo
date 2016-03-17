//
//  APIResult.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIResult : NSObject

@property (nonatomic, assign) BOOL isSucc;
@property (nonatomic, strong) NSString    *msg;


@end
