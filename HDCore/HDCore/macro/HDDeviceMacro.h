//
//  HDDeviceMacro.h
//  HDCore
//
//  Created by zhangdadi on 15/6/26.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#ifndef HDCore_HDDeviceMacro_h
#define HDCore_HDDeviceMacro_h

// 注册通知
#define HDNOTIFY_ADD(_noParamsFunc, _notifyName)  [[NSNotificationCenter defaultCenter] \
addObserver:self \
selector:@selector(_noParamsFunc) \
name:_notifyName \
object:nil];

// 发送通知
#define HDNOTIFY_POST(_notifyName)   [[NSNotificationCenter defaultCenter]postNotificationName:_notifyName object:nil];

// 移除通知
#define HDNOTIFY_REMOVE(_notifyName) [[NSNotificationCenter defaultCenter] removeObserver:self name:_notifyName object:nil];


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
