//
//  CalendarViewController.h
//  spos3
//
//  Created by sun on 15/5/11.
//  Copyright (c) 2015年 Aims. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderButton.h"

@class CalendarViewController;

@protocol CalendarSelectDelegate <NSObject>

- (void)selectCtrl:(CalendarViewController *)calendarCtrl selectedDate:(NSDate *)selectedDate;

- (void)dismissCtrl:(UIViewController *)popCtrl;

@end

@interface CalendarViewController : UIViewController

@property (nonatomic, weak) NSDate *setDate;
@property (nonatomic, weak) id <CalendarSelectDelegate> delegate;

@property (weak, nonatomic) IBOutlet BorderButton *closeBtn;
@property (nonatomic, copy) NSString *cNext;
@property (nonatomic, strong) NSArray *cWeekName;
@property (nonatomic, copy) NSString *cPrevious;
@property (nonatomic, copy) NSString *cMonth;

@end
