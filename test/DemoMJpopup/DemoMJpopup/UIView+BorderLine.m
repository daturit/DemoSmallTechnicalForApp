//
//  UIView+BorderLine.m
//  spos3
//
//  Created by Kimura Satoshi on 14/12/10.
//  Copyright (c) 2014年 Aims. All rights reserved.
//

#import "UIView+BorderLine.h"

@implementation UIView (BorderLine)

- (void)setBorderLineWithColor:(UIColor *)color {
    if (color) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = color.CGColor;
    } else {
        self.layer.borderWidth = 0;
    }
}

@end
