//
//  HDDeviceMacro.h
//  HDCore
//
//  Created by zhangdadi on 15/6/26.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#ifndef HDCore_HDDeviceMacro_h
#define HDCore_HDDeviceMacro_h

/*********************************** 通知方法相关 ***********************************/
#define MC_UNSET()														[[NSNotificationCenter defaultCenter] removeObserver:self];
#define MC_SET_(_selectorOwner, _selector, _notifyName, _obj)			[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_selector:) name:_notifyName object:_obj];
#define MC_SET(_selector, _notifyName)									MC_SET_(self, _selector, _notifyName, nil)

#define MC_POST_(_notifyName, _obj)										[[NSNotificationCenter defaultCenter] postNotificationName:_notifyName object:_obj];
#define MC_POST(_notifyName)											MC_POST_(_notifyName, nil)
#define ARRAYCOUNT(X)  sizeof(X)/sizeof(X[0])

// 注册通知
#define NOTIFY_ADD(_noParamsFunc, _notifyName)  [[NSNotificationCenter defaultCenter] \
addObserver:self \
selector:@selector(_noParamsFunc) \
name:_notifyName \
object:nil];

// 发送通知
#define NOTIFY_POST(_notifyName)   [[NSNotificationCenter defaultCenter]postNotificationName:_notifyName object:nil];

// 移除通知
#define NOTIFY_REMOVE(_notifyName) [[NSNotificationCenter defaultCenter] removeObserver:self name:_notifyName object:nil];

//字体大小
#define FONTSIZE_BIGA           20
#define FONTSIZE_BIGB           18
#define FONTSIZE_MIDA           16
#define FONTSIZE_MIDB           14
#define FONTSIZE_MINA           12
#define FONTSIZE_MINB           10
#define FONTSIZE_MINC           6


//标量字体
#define FONT_BIGA               [UIFont systemFontOfSize:FONTSIZE_BIGA]
#define FONT_BIGB               [UIFont systemFontOfSize:FONTSIZE_BIGB]
#define FONT_MIDA               [UIFont systemFontOfSize:FONTSIZE_MIDA]
#define FONT_MIDB               [UIFont systemFontOfSize:FONTSIZE_MIDB]
#define FONT_MINA               [UIFont systemFontOfSize:FONTSIZE_MINA]
#define FONT_MINB               [UIFont systemFontOfSize:FONTSIZE_MINB]
#define FONTOFSIZE(size)        [UIFont systemFontOfSize:size]
#define BFONTOFSIZE(SIZE)		[UIFont boldSystemFontOfSize:SIZE]

#define FONT_CELL_DETAIL        [UIFont systemFontOfSize:13]    //tableview描述文字字体

//字体操作
#define TXTSIZE_(TEXT,FONT,MINSIZE,ACTUAL_FONT_SIZE,FORWIDTH,BREAKMODE)\
[TEXT sizeWithFont:FONT minFontSize:MINSIZE actualFontSize:ACTUAL_FONT_SIZE forWidth:FORWIDTH lineBreakMode:BREAKMODE]
#define TXTSIZE(TEXT,FONT,MINSIZE)   [TEXT sizeWithFont:FONT]//\
TXTSIZE_(TEXT,FONT,MINSIZE,nil,300,UILineBreakModeWordWrap)
#define labelActualFontSize(label,font,actualFontSizePointer,forWidth) [label.text sizeWithFont:font minFontSize:FONTSIZE_MINC actualFontSize:actualFontSizePointer forWidth:forWidth lineBreakMode:label.lineBreakMode]

//控件间距
#define CONTROL_DISTANCE_A      20
#define CONTROL_DISTANCE_B      10
#define CONTROL_DISTANCE_C      5
#define CONTROL_DISTANCE_D      2

//基本控件大小
#define CL_H_AAA                120
#define CL_H_AA                 100
#define CL_H_A                  60
#define CL_H_B                  40
#define CL_H_C                  30
#define CL_H_D                  25
#define CL_H_E                  18
#define CL_H_F                  44
#define LIST_AVATAR_SIZE        52

#define AVATAR_W_A              CELL_AVATAR_W
#define AVATAR_W_B              60
#define AVATAR_W_C              45

#define BASE_COVER_H            90
#define COVER_H                 250
#define COVER_H_Max             380
#define COVER_H_DIS             (COVER_H_Max - COVER_H)
#define DEF_COVER_W             320
#define DEF_COVER_H             250
#define CELL_BACKCOLOR          [UIColor colorWithWhite:0.95f alpha:1.0f]

#define ulabel(label,frame,alignment)\
label = [[[UILabel alloc]initWithFrame:frame]autorelease];\
label.backgroundColor = [UIColor clearColor];\
label.font = FONT_MINA;\
label.textAlignment = alignment;\


//FRAME操作
#define ScreenWidth           [UIScreen mainScreen].bounds.size.width
#define ScreenHeight          [UIScreen mainScreen].bounds.size.height
#define HDRectMake                  (CGRectMake(0, 0, ScreenWidth, ScreenHeight))
#define NAV_HEIGHT            44  //NavigationItem 高
#define TAB_HEIGHT            49  //tabbar高
#define STATUSBAR_H           20
#define MAIN_HEIGHT           (ScreenHeight - NAV_HEIGHT - STATUSBAR_H - TAB_HEIGHT)



#endif
