//
//  DemoModel.h
//  HDServices
//
//  Created by zhangdadi on 15/4/2.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <HDServices/HDServices.h>


@interface DemoModelItem : BaseJSONModel

@property (nonatomic, assign) NSInteger CityCode;
@property (nonatomic, strong) NSString *CityName;
@property (nonatomic, strong) NSString *FirstWord;
@property (nonatomic, assign) NSInteger Id;

@end
@protocol DemoModelItem <NSObject>
@end



@interface DemoModel : BaseJSONModel
@property (nonatomic, strong) NSArray<DemoModelItem> *Data;
@end

