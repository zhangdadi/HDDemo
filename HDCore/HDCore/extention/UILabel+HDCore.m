//
//  UILabel+HDCore.m
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import "UILabel+HDCore.h"

@implementation UILabel (HDCore)

-(void)resizeToStretch{
    float width = [self expectedWidth];
    CGRect newFrame = [self frame];
    newFrame.size.width = width;
    [self setFrame:newFrame];
}

-(float)expectedWidth{
    [self setNumberOfLines:1];
    
    CGSize maximumLabelSize = CGSizeMake(9999,self.frame.size.height);
    
    CGSize expectedLabelSize = [[self text] sizeWithFont:[self font]
                                       constrainedToSize:maximumLabelSize
                                           lineBreakMode:[self lineBreakMode]];
    return expectedLabelSize.width;
}

- (void)resizeToHeight {
    CGSize labelsize = [self boundingRect];
    CGRect newFrame = self.frame;
    newFrame.size.height = labelsize.height;
    self.frame = newFrame;
}

- (CGSize)boundingRect
{
    return [UILabel calculateHeightWithText:self.text font:self.font size:self.frame.size lineBreakMode:self.lineBreakMode];
}

+ (CGSize)calculateHeightWithText:(NSString *)text font:(UIFont *)font size:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    CGSize retSize;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        NSDictionary *attribute = @{NSFontAttributeName:font};
        retSize = [text boundingRectWithSize:size
                                     options:
                   NSStringDrawingTruncatesLastVisibleLine |
                   NSStringDrawingUsesFontLeading |
                   NSStringDrawingUsesLineFragmentOrigin                                              attributes:attribute
                                     context:nil].size;
    } else {
        retSize = [text sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
    }
    return retSize;
}



@end
