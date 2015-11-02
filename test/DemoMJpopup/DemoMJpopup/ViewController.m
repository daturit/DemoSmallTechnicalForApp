//
//  ViewController.m
//  DemoMJpopup
//
//  Created by ivs on 10/30/15.
//  Copyright © 2015 ivs. All rights reserved.
//

#import "ViewController.h"
#import "CalendarViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "DemoViewController.h"

@interface ViewController ()<CalendarSelectDelegate, DemoSelectDelegate>

@property (strong, nonatomic) NSDate *regiDateValue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)popupBtn:(id)sender {
    // NSDate *date;
    // NSLog(@"this is updateRegiDate!");
//    NSDate *date;
//    if(self.regiDateValue) {
//        date = self.regiDateValue;
//    } else {
//        date = [NSDate date];
//        NSLog(@"this is date 2: %@", date);
//    }
//    
//    CalendarViewController *calendarCtrl = [[CalendarViewController alloc] initWithNibName:nil bundle:nil];
//    calendarCtrl.delegate = self;
//    [calendarCtrl setSetDate:date];
//    [self presentPopupViewController:calendarCtrl animationType:MJPopupViewAnimationFade];
    
    DemoViewController *demoCtrl = [[DemoViewController alloc] initWithNibName:nil bundle:nil];
    demoCtrl.delegate = self;
    [self presentPopupViewController:demoCtrl animationType:MJPopupViewAnimationFade];
    
}

//-(void) selectCtrl:(CalendarViewController *)calendarCtrl selectedDate:(NSDate *)selectedDate{
//    self.regiDateValue = selectedDate;
//    NSLog(@"This is date after you choose: %@", self.regiDateValue);
//    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
//}

-(void) dismissCtrl:(UIViewController *)popCtrl {
    
    if([popCtrl isKindOfClass:[DemoViewController class]]) {
        [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
