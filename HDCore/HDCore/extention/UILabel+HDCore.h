//
//  UILabel+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HDCore)

//根据内容调整宽度
-(void)resizeToStretch;
//根据内容调整高度
- (void)resizeToHeight;


//计算高度
+ (CGSize)calculateHeightWithText:(NSString *)text
                             font:(UIFont *)font
                             size:(CGSize)size
                    lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
