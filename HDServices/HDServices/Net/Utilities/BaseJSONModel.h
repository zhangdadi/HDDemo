//
//  BaseJSONModel.h
//  shareNNShop
//
//  Created by adh-mjb on 14-10-28.
//  Copyright (c) 2014年 adh 马骏斌. All rights reserved.
//

#import <HDServices/JSONModel.h>
#import <HDServices/APIResult.h>

@interface BaseJSONModel : JSONModel

// 将dictionary转化为model
+(id)parse:(id)jsonData;

-(id)initWithDictionary:(NSDictionary*)dict;

@end
