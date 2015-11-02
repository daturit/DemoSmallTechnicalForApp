//
//  Constant.h
//  DemoMJpopup
//
//  Created by ivs on 11/2/15.
//  Copyright © 2015 ivs. All rights reserved.
//

#ifndef Constant_h
#define Constant_h


#endif /* Constant_h */



#define UUID_KEY                @"uuid"
#define USER_CODE_KEY           @"user_code"
#define TIMEZONE_KEY            @"timezone"

#define STATUS_ACTIVE      @"ACTIVE"
#define STATUS_EXPIRED     @"EXPIRED"
#define STATUS_VALID       @"VALID"
#define STATUS_CANCEL      @"CANCEL"

#define DB_NEW_KEY                 @"NEW"
#define DB_UPDATE_KEY              @"UPDATE"
#define DB_DELETE_KEY              @"DELETE"
#define DB_CONSUME_KEY             @"CONSUME"

#define SERVER_HOST             @"http://spos3.youmail.jp/spos3lic/if"
#define API_USER_PROFILE_INPUT  @"http://spos3.youmail.jp/spos3lic/user/user_profile_input.html"
#define API_DEVICE_ADD_INPUT    @"http://spos3.youmail.jp/spos3lic/user/device_add_input.html"
#define API_SHOP_ADD_INPUT      @"http://spos3.youmail.jp/spos3lic/user/shop_add_input.html"
#define API_SETTING_TOP         @"http://spos3.youmail.jp/spos3/user/setting_top.html"
#define API_REGI_MENU           @"http://spos3.youmail.jp/spos3/user/regi_menu.html"
#define API_ITEM_MENU           @"http://spos3.youmail.jp/spos3/user/business_report.html"

#define API_HELP_MENU           @"http://spos3.youmail.jp/spos3lic/user/help/index.html"


#define TEXTFILED_NUMBER        @"0123456789\n"

#define LOCALE_DEFAULT          @"default"
#define LOCALE_EN               @"en"
#define LOCALE_JA               @"ja"

//text
#define T_STATUS                @"status"
#define T_RESULT                @"result"
#define T_ERR_CODE              @"err_code"
#define T_ERR_MSG               @"err_msg"
#define T_OK                    @"OK"
#define T_NG                    @"NG"
#define T_ERROR                 @"ERROR"

//notification
#define DATEVIEWTYPE            @"DateViewType"
#define DAYVIEWTYPE             @"DayViewType"
#define WEEKVIEWTYPE            @"WeekViewType"
#define MONTHVIEWTYPE           @"MonthViewType"

// product_type
#define PRODUCT_TYPE_ITEM            @"ITEM" // 商品
#define PRODUCT_TYPE_ITEM_CANCEL     @"ITEM_CANCEL"
#define PRODUCT_TYPE_TECHNIC         @"TECHNIC" // 技術
#define PRODUCT_TYPE_TECHNIC_CANCEL  @"TECHNIC_CANCEL"
#define PRODUCT_TYPE_COURSE          @"COURSE" // コース
#define PRODUCT_TYPE_COURSE_CANCEL   @"COURSE_CANCEL"
#define PRODUCY_TYPE_FEE             @"FEE" // 手数料
#define PRODUCY_TYPE_DISCOUNT        @"DISCOUNT" // 全体割引

#define NETWORKING_TIMEOUT_INTERVAL     30

// payment_method
// 顺番は現金、カード、信販、金券その他
#define PAYMENT_METHOD_CASH      @"CASH" // 現金
#define PAYMENT_METHOD_CARD      @"CARD" // カード
#define PAYMENT_METHOD_LOAN      @"LOAN" // 信販
#define PAYMENT_METHOD_TICKET    @"TICKET" // 金券・その他

// reserve_method
#define RESERVE_METHOD_PHONE     @"PHONE" // 電話予約
#define RESERVE_METHOD_WEB       @"WEB" // Web予約
#define RESERVE_METHOD_NEXT      @"NEXT" // 前回来店時

// 予約画面には、データの最小表示時間
#define ORDER_DISPLAY_MIN_TIME   30

// Printer
#define PRINTER_PORTNAME     @"BT:Star Micronics"
#define PRINTER_SETTINGS     @"Standard"

// エラーコード設定
#define ERR_CODE_MODIFY_1     @"m101" // 内容の変更がありません
#define ERR_CODE_NETWORK_1    @"n101" // コース契約、消化にはネットワーク接続が必要です
// Login
#define ERR_CODE_LOGIN_1     @"l101" // ID、パスワードを入力してください
#define ERR_CODE_LOGIN_2     @"l102" // IDまたはパスワードが不正です

// ShopSelect
#define ERR_CODE_SHOP_1      @"s101" // 店舗の取得が失敗しました
#define ERR_CODE_SHOP_2      @"s102" // パスワードが不正です
#define ERR_CODE_SHOP_3      @"s103" // 店舗、パスワードを入力してください

// ItemSelect
#define ERR_CODE_MENU_1      @"m101" // 施術時間を入力してください
#define ERR_CODE_MENU_2      @"m102" // 施術時間の最大値1440分を超えています
#define ERR_CODE_MENU_3      @"m103" // 指名を行う場合は担当者を指定してください

// Customer
#define ERR_CODE_CUSTOMER_1  @"c101" // 顧客を選択してください
#define ERR_CODE_CUSTOMER_2  @"c102" // 顧客No.が重複しました
#define ERR_CODE_CUSTOMER_3  @"c103" // メールが不正です
#define ERR_CODE_CUSTOMER_4  @"c104" // 郵便番号が不正です
#define ERR_CODE_CUSTOMER_5  @"c105" // 顧客No.が不正です
#define ERR_CODE_CUSTOMER_6  @"c106" // 住所が見つかりません
#define ERR_CODE_CUSTOMER_7  @"c107" // 郵便番号を入力ください
#define ERR_CODE_CUSTOMER_8  @"c108" // 電話番号が不正です
#define ERR_CODE_CUSTOMER_9  @"c109" // 携帯番号が不正です
#define ERR_CODE_CUSTOMER_10  @"c110" // 顧客が存在しない
#define ERR_CODE_CUSTOMER_11  @"c111" // 氏名を入力してください
#define ERR_CODE_CUSTOMER_12  @"c112" // 指定された顧客No.は存在しません

// Order
#define ERR_CODE_ORDER_1     @"r101" // 施術メニューを追加できません
#define ERR_CODE_ORDER_2     @"r102" // 該当の顧客は存在しません
#define ERR_CODE_ORDER_3     @"r103" // メニューを選択してください
#define ERR_CODE_ORDER_4     @"r104" // 在店状態の予約は内容の変更ができません
#define ERR_CODE_ORDER_5     @"r105" // 同時間の予約数が施術台数を超えているため予約できません
#define ERR_CODE_ORDER_5b    @"r105b" // 同時間の予約数が同時予約可能数を超えているため予約できません
#define ERR_CODE_ORDER_6     @"r106" // %@さんの最大予約数を超えているため予約できません
#define ERR_CODE_ORDER_7     @"r107" // 該当時間帯は最大予約数を超えているため予約できません
#define ERR_CODE_ORDER_8     @"r108" // 同じ時間帯に同じ顧客の予約が存在します
#define ERR_CODE_ORDER_9     @"r109" // 退店状態の予約は内容の変更ができません
#define ERR_CODE_ORDER_10    @"r110" // 開始時間が開店時間前のため、予約できません
#define ERR_CODE_ORDER_11    @"r111" // 過去の時間の予約はできません
#define ERR_CODE_ORDER_12    @"r112" // 終了時間が閉店時間を超過しているため、予約できません
#define ERR_CODE_ORDER_13    @"r113" // 開始時間を入力してください
#define ERR_CODE_ORDER_14    @"r114" // 終了時間を入力してください
#define ERR_CODE_ORDER_15    @"r115" // 指定したコースの残回数が足りないため予約できません
#define ERR_CODE_ORDER_16    @"r116" // 営業時間外のため、予約を登録できません
#define ERR_CODE_ORDER_17    @"r117" // 終了時間が、24時を超えているため予約ができません
#define ERR_CODE_ORDER_18    @"r118" // 指名を行う場合は主担当者を指定してください


// skip
#define ERR_CODE_ACCOUNT_1   @"a101" // 精算内容を入力ください
#define ERR_CODE_ACCOUNT_2   @"a102" // カードが請求金額より多い
#define ERR_CODE_ACCOUNT_3   @"a103" // 信販が請求金額より多い
#define ERR_CODE_ACCOUNT_4   @"a104" // 二つ支払方式が請求金額より多い
#define ERR_CODE_ACCOUNT_5   @"a105" // 支払額と支払方法の組合せが不正です
#define ERR_CODE_ACCOUNT_6   @"a106" // 伝票取消時で、支払金額が不足
#define ERR_CODE_ACCOUNT_7   @"a107" // 予約/消化の実績があるコース契約を含む伝票が取消できない
#define ERR_CODE_ACCOUNT_8   @"a108" // 契約コースの残数が不足しています
#define ERR_CODE_ACCOUNT_9   @"a109" // 数量は1以上を指定してください
#define ERR_CODE_ACCOUNT_10  @"a110" // カードまたは電子マネーの支払額が請求額より多くなっています
#define ERR_CODE_ACCOUNT_11  @"a111" // 主担当を選択してください
#define ERR_CODE_ACCOUNT_12  @"a112" // コースの残回数が不足です

// bill
#define ERR_CODE_BILL_1      @"b101" // 売上日範囲の選択が不正です
#define ERR_CODE_BILL_2      @"b102" // 印刷内容がない

// print
#define ERR_CODE_PRINTER_1   @"p101" // プリンタがみつかりません

// week
#define WEEK_MONDAY        @"MONDAY"
#define WEEK_TUESDAY       @"TUESDAY"
#define WEEK_WEDNESDAY     @"WEDNESDAY"
#define WEEK_THURSDAY      @"THURSDAY"
#define WEEK_FRIDAY        @"FRIDAY"
#define WEEK_SATURDAY      @"SATURDAY"
#define WEEK_SUNDAY        @"SUNDAY"

#define BILL_COINS_UNIT    @"bill_coins_unit_JPY"

#define ERR_CODE_REGI_1     @"r101" // 内容の変更がありません
