//
//  DemoViewController.m
//  DemoMJpopup
//
//  Created by ivs on 10/30/15.
//  Copyright © 2015 ivs. All rights reserved.
//

#import "DemoViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "Screen1ViewController.h"

@interface DemoViewController ()



@end

@implementation DemoViewController

//NSString *s = @"x";
//id obj = s;
//NSArray *a = obj;
// SEL shootSelector = @selector(shoot);

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)MoveToNewScreen:(id)sender {
    
    NSLog(@"this is move to new screen!");
    
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
//    self.view.window.rootViewController = [[Demo1ViewController alloc] initWithNibName:nil bundle:nil];
    self.view.window.rootViewController = [[Screen1ViewController alloc] initWithNibName:nil bundle:nil];
}

- (void)dismissCtrl:(UIViewController *)popCtrl {
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}

- (IBAction)Close:(id)sender {
    NSDate *date;
    date = [NSDate date];
    
    if ([self.delegate respondsToSelector:@selector(selectCtrl:selectedDate:)]) {
        [self.delegate selectCtrl:self selectedDate:date];
    }
    
    if([self.delegate respondsToSelector:@selector(dismissCtrl:)]) {
        [self.delegate dismissCtrl:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
