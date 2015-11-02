//
//  BorderButton.m
//  spos3
//
//  Created by Kimura Satoshi on 14/12/9.
//  Copyright (c) 2014年 Aims. All rights reserved.
//

#import "BorderButton.h"
#import "UIView+BorderLine.h"

@interface BorderButton()

@end

@implementation BorderButton {
    UIColor *_borderColor;
}

- (void)awakeFromNib
{
    [self setBorderLineWithColor:_borderColor];
    [super awakeFromNib];
    self.backColor = self.backgroundColor;
    self.fontColor = self.titleLabel.textColor;
}

- (void)setHighlighted:(BOOL)highlighted {
    if (highlighted) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = self.backColor;
        [self setBorderLineWithColor:self.backColor];
    } else {
        self.backgroundColor = self.backColor;
        self.titleLabel.textColor = self.fontColor;
        [self setBorderLineWithColor:nil];
    }
}

- (void)setEnabled:(BOOL)enabled {
    if (enabled) {
        [self setAlpha:1];
    } else {
        [self setAlpha:0.4];
    }
    [super setEnabled:enabled];
}

@end
