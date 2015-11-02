//
//  CalendarViewController.m
//  spos3
//
//  Created by sun on 15/5/11.
//  Copyright (c) 2015年 Aims. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarView.h"
#import "UIViewController+MJPopupViewController.h"

@interface CalendarViewController () <CalendarDelegate>

@property (strong, nonatomic) IBOutlet CalendarView *calendarView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.calendarView = [[CalendarView alloc]initWithFrame:CGRectMake(0, -15, self.view.frame.size.width, self.view.frame.size.height - 50)];
    _calendarView.delegate = self;
    [_calendarView setBackgroundColor:[UIColor clearColor]];
    [_calendarView setCalendarDate:self.setDate];
    [self setViewValue];
    _calendarView.next = self.cNext;
    _calendarView.previous = self.cPrevious;
    _calendarView.weekName = self.cWeekName;
    _calendarView.month = self.cMonth;
    [self.view addSubview:_calendarView];
//    [self.calendarView addSubview:self.backBtn];
}
//add by wyw
- (void)setViewValue{
    
    if ([[[NSLocale currentLocale] localeIdentifier] hasPrefix:@"ja_"]) {
        
        [self.closeBtn setTitle:@"閉じる" forState:UIControlStateNormal];
        self.cNext = @"次";
        self.cMonth = @"月";
        self.cPrevious = @"前";
        self.cWeekName = @[@"月",@"火",@"水",@"木",@"金",@"土",@"日"];
    } else {
        [self.closeBtn setTitle:@"Close" forState:UIControlStateNormal];
        self.cNext = @"Next";
        self.cMonth = @"Month";
        self.cPrevious = @"Previous";
        self.cWeekName = @[@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa",@"Su"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tappedOnDate:(NSDate *)selectedDate
{
    if ([self.delegate respondsToSelector:@selector(selectCtrl:selectedDate:)]) {
        [self.delegate selectCtrl:self selectedDate:selectedDate];
    }
}

- (void)dismissCtrl:(UIViewController *)popCtrl {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}

- (IBAction)dismissDialog:(id)sender {
    if ([self.delegate respondsToSelector:@selector(dismissCtrl:)]) {
        [self.delegate dismissCtrl:self];
    }
}

@end
