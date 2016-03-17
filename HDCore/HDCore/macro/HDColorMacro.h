//
//  HDColorMacro.h
//  HDCore
//
//  Created by 张达棣 on 15/3/20.
//  Copyright (c) 2015年 HD. All rights reserved.
//
/**
 *  全局使用的核心宏
 */

#ifndef HDCore_HDColorMacro_h
#define HDCore_HDColorMacro_h

// 颜色16进制转换
#define HDColorFromHexadecimalRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HDColorFromHexadecimalRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define HDColorFromRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define HDColorFromRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


//统一字体颜色
#define HDFontColorForMainText  UIColorFromRGB(0x222222)     // 字体主颜色
#define HDFontColorForSubText  UIColorFromRGB(0xADADAD)     // 副标题主颜色
#define HDFontColorForGrayText  UIColorFromRGB(0x8E8E8E)     // 灰色主颜色
#define HDFontColorForMainRED  UIColorFromRGB(0xFF4D00)     // 主颜色,红色
#define HDFontColorForMainBg  UIColorFromRGB(0xF1F1F1)     // 主背景色
#define HDFontColorForGrayLine UIColorFromRGB(0xB2B2B2)  // 分割线
#define HDFontColorForMask UIColorFromRGBA(0x000000, 0.25f) // 遮罩层
#define HDFontColorForProperty  UIColorFromRGB(0xF9F9F9)     // 背景色
#define HDFontColorForValidateTipsBG UIColorFromRGBA(0xFF0000, 0.6f) // 表单验证tips背景



#endif
