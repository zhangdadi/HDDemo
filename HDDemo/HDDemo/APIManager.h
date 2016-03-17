//
//  APIManager.h
//  HDDemo
//
//  Created by zhangdadi on 15/7/3.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager1 : NSObject

//下面的都是相同的一个url，类型参加封装在方法里，调用者直接调用方法。但如果类型参数太多，写的方法需要写很多，以后其中一个类型参数多加一个变量，又要写很多接口
+ (void)apiType1AndCate1;
+ (void)apiType2AndCate1;
+ (void)apiType3AndCate1;

+ (void)apiType1AndCate2;
+ (void)apiType2AndCate2;
+ (void)apiType3AndCate2;

+ (void)apiType1AndCate3;
+ (void)apiType2AndCate3;
+ (void)apiType3AndCate3;


@end

typedef NS_ENUM(int, Type) { //类型参数
    type1,
    type2,
    type3
};

typedef NS_ENUM(int, Cate) {  //类型参数
    Cate1,
    Cate2,
    Cate3
};


@interface APIManager2 : NSObject

+ (void)apiType:(Type)type cate:(Cate)cate;  //类型参数通过调用者传进来，调用者要传类型参数。

@end

