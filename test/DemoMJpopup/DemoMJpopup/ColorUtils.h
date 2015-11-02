//
//  ColorUtils.h
//  spos3
//
//  Created by Kimura Satoshi on 15/1/9.
//  Copyright (c) 2015年 Aims. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorUtils : NSObject

//Color
#define RED                     @"217.0.0"
#define B_RED                   @"255.166.77"
#define PINK                    @"236.127.127"
#define LT_YELLOW               @"255.235.215"
#define GREEN                   @"37.155.36"
#define YELLOW                  @"255.205.64"
#define PURPLE                  @"68.38.160"
#define LT_RED                  @"255.82.82"
#define LT_PINK                 @"255.151.187"
#define LT_GREEN                @"139.195.74"
#define BLUE                    @"0.188.212"
#define LT_PURPLE               @"171.71.188"
#define LOGOUT                  @"91.98.132"


+ (UIColor *)colorWithDefine:(NSString *)define alpha:(CGFloat)alpha;

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

// 予約
+ (UIColor *)defaultOrderColor;

// 会計
+ (UIColor *)defaultSkipColor;

// レジ金管理
+ (UIColor *)defaultRegiManagerColor;

// 伝票確認
+ (UIColor *)defaultSaleColor;

// レジ締め
+ (UIColor *)defaultRegiCountColor;

// 電子カルテ
+ (UIColor *)defaultRecordColor;

// 業務報告
+ (UIColor *)defaultItemMangerColor;

// 設定
+ (UIColor *)defaultSettingColor;

// SOSIA POS
+ (UIColor *)defaultPosColor;

// logout
+ (UIColor *)defaultLogoutColor;

+ (UIColor *)colorWithHexString: (NSString *)hex alpha:(CGFloat)alpha;

@end
