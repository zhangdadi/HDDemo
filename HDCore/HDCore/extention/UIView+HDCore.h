//
//  UIView+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HDCore)

@property CGPoint vOrigin;
@property CGSize vSize;
@property CGFloat vWidth;
@property CGFloat vHeight;

//位置
@property CGFloat vLeft;
@property CGFloat vRight;
@property CGFloat vTop;
@property CGFloat vBottom;


- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (UIViewController*)viewController;
-(void)removeAllChildren;

@end
