//
//  BaseJSONPageModel.h
//  HDServices
//
//  Created by zhangdadi on 15/6/30.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <HDServices/HDServices.h>

@interface BaseJSONPageModel : BaseJSONModel

@property (nonatomic,assign)int CurrentPageIndex; //页码
@property (nonatomic,assign)int PageSize; //每页大小
/**
 *  总数
 */
@property (nonatomic,assign)int TotalItemCount;
/**
 *  页数
 */
@property (nonatomic,assign)int TotalPageCount;


@end
