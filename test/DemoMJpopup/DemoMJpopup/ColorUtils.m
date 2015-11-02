//
//  ColorUtils.m
//  spos3
//
//  Created by Kimura Satoshi on 15/1/9.
//  Copyright (c) 2015年 Aims. All rights reserved.
//

#import "ColorUtils.h"

@implementation ColorUtils

+ (UIColor *)colorWithDefine:(NSString *)define alpha:(CGFloat)alpha {
    if (define) {
        NSArray *rgb = [define componentsSeparatedByString:@"."];
        if (rgb.count == 3) {
            return [UIColor colorWithRed:[rgb[0] intValue]/ 255.0f green:[rgb[1] intValue] / 255.0f blue:[rgb[2] intValue] / 255.0f alpha:alpha];
        }
    }
    return [UIColor clearColor];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha / 1.0f];
}

+ (UIColor *)defaultOrderColor
{
    return [self colorWithDefine:GREEN alpha:1];
}

+ (UIColor *)defaultSkipColor
{
    return [self colorWithDefine:B_RED alpha:1];
}

// レジ金管理
+ (UIColor *)defaultRegiManagerColor {
    return [self colorWithDefine:PURPLE alpha:1];
}

// 伝票確認
+ (UIColor *)defaultSaleColor {
    return [self colorWithDefine:LT_RED alpha:1];
}

// レジ締め
+ (UIColor *)defaultRegiCountColor {
    return [self colorWithDefine:LT_PINK alpha:1];
}

// 電子カルテ
+ (UIColor *)defaultRecordColor {
    return [self colorWithDefine:LT_GREEN alpha:1];
}

// 業務報告
+ (UIColor *)defaultItemMangerColor{
    return [self colorWithDefine:BLUE alpha:1];
}

// 設定
+ (UIColor *)defaultSettingColor {
    return [self colorWithDefine:LT_PURPLE alpha:1];
}

// SOSIA POS
+ (UIColor *)defaultPosColor {
    return [self colorWithDefine:B_RED alpha:1];
}

// ログアウト
+ (UIColor *)defaultLogoutColor {
    return [self colorWithDefine:LOGOUT alpha:1];
}

+ (CGFloat) colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt:&hexComponent];
    return hexComponent / 255.0;
}

// hexString to color
//+ (UIColor *)colorWithHexString: (NSString *)hex alpha:(CGFloat)alpha {
//    if (![hex hasPrefix:@"#"]) {
//        hex = [NSString stringWithFormat:@"#%@", hex];
//    }
//    DLog(@"hex:%@", hex);
//    NSInteger hexValue = [hex integerValue];
//    DLog(@"hexValue:%i", hexValue);
//    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0f green:((float)((hexValue & 0xFF00) >> 8))/255.0f blue:((float)(hexValue & 0xFF))/255.0f alpha:alpha];
//}

+ (UIColor *)colorWithHexString: (NSString *)hex alpha:(CGFloat)alpha {
    NSString *colorString = [[hex stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat red = 0, blue = 0, green = 0;
    switch ([colorString length]) {
        case 3: // #RGB
            red   = [self colorComponentFrom:colorString start:0 length:1];
            green = [self colorComponentFrom:colorString start:1 length:1];
            blue  = [self colorComponentFrom:colorString start:2 length:1];
            return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
            
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start:0 length:1];
            red   = [self colorComponentFrom:colorString start:1 length:1];
            green = [self colorComponentFrom:colorString start:2 length:1];
            blue  = [self colorComponentFrom:colorString start:3 length:1];
            return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
            
        case 6: // #RRGGBB
            red   = [self colorComponentFrom:colorString start:0 length:2];
            green = [self colorComponentFrom:colorString start:2 length:2];
            blue  = [self colorComponentFrom:colorString start:4 length:2];
            return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
            
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start:0 length:2];
            red   = [self colorComponentFrom:colorString start:2 length:2];
            green = [self colorComponentFrom:colorString start:4 length:2];
            blue  = [self colorComponentFrom:colorString start:6 length:2];
           return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    return [UIColor clearColor];
}

@end
