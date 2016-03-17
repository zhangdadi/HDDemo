//
//  UIViewController+HDAdditions.h
//  DriveCloudPhone
//
//  Created by 张达棣 on 14-7-8.
//  Copyright (c) 2014年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HDAdditions)

/**
 *  自定义导航栏返回按钮，默认自带返回文字
 *
 *  @param targe  回调对象
 *  @param action 回调方法
 *
 *  @return 返回此对象
 */
- (UIBarButtonItem *)customBackButtonTarget:(id)targe action:(SEL)action; //默认自带返回文字
- (UIBarButtonItem *)customBackButtonTitle:(NSString *)title target:(id)targe action:(SEL)action;


/**
 *  自定义导航栏左边按钮
 *
 *  @param title  按钮标题
 *  @param targe  回调对象
 *  @param action 回调方法
 *
 *  @return 返回此对象
 */
- (UIBarButtonItem *)customLeftButtonTitle:(NSString *)title target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)customLeftButtonImageName:(NSString *)imageName target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)customLeftButtonTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action;


/**
 *  自定义导航栏右边按钮
 *
 *  @param title  按钮标题
 *  @param targe  回调对象
 *  @param action 回调方法
 *
 *  @return 此对象
 */
- (UIBarButtonItem *)customRightButtonTitle:(NSString *)title target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)customRightButtonImageName:(NSString *)imageName target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)customRightButtonTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action;

/**
 *  自定义导航栏右边多个按钮
 *
 *  @param imageNameArray 多个按钮的背景图片名字数组
 *  @param targetArray    多个按钮的回调对象数组
 *  @param actionArray    多个按钮的回调方法数组 NSString类型
 *
 *  @return UIBarButtonItem数组
 */
- (NSArray *)customMultipleRightButtonImageNames:(NSArray *)imageNameArray targets:(NSArray *)targetArray actions:(NSArray *)actionArray;

//自定义导航栏按钮
- (UIBarButtonItem *)customNavButtonTitle:(NSString *)title target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)customNavButtonImageName:(NSString *)imageName target:(id)targe action:(SEL)action;
- (UIBarButtonItem *)customNavButtonTitle:(NSString *)title imageName:(NSString *)imageName target:(id)targe action:(SEL)action;

@end
