//
//  UIView+HDCore.m
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "UIView+HDCore.h"

@implementation UIView (HDCore)

// Retrieve and set the origin
- (CGPoint) vOrigin
{
    return self.frame.origin;
}

- (void) setVOrigin: (CGPoint) aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}

// Retrieve and set the size
- (CGSize) vSize
{
    return self.frame.size;
}

- (void) setVSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

- (CGFloat)vWidth {
    return self.vSize.width;
}

- (void)setVWidth:(CGFloat)width {
    self.VSize = CGSizeMake(width, self.vHeight);
}

- (CGFloat)vHeight {
    return self.vSize.height;
}

- (void)setVHeight:(CGFloat)height {
    self.vSize = CGSizeMake(self.vWidth, height);

}


//位置

- (CGFloat)vLeft {
    return self.frame.origin.x;
}

- (void)setVLeft:(CGFloat)vLeft {
    CGRect newframe = self.frame;
    newframe.origin.x = vLeft;
    self.frame = newframe;
}

- (CGFloat)vRight {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setVRight:(CGFloat)vRight {
    CGFloat delta = vRight - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (CGFloat)vTop {
    return self.frame.origin.y;

}

- (void)setVTop:(CGFloat)vTop {
    CGRect newframe = self.frame;
    newframe.origin.y = vTop;
    self.frame = newframe;

}

- (CGFloat)vBottom {
    return self.frame.origin.y + self.frame.size.height;

}

- (void)setVBottom:(CGFloat)vBottom {
    CGRect newframe = self.frame;
    newframe.origin.y = vBottom - self.frame.size.height;
    self.frame = newframe;
}


// Move via offset
- (void) moveBy: (CGPoint) delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

- (UIViewController*)viewController
{
    UIResponder *nextResponder =  self;
    
    do
    {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}

-(void)removeAllChildren{
    for(UIView *view in self.subviews){
        [view removeFromSuperview];
    }
}


@end
