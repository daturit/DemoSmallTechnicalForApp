//
//  DemoViewController.h
//  DemoMJpopup
//
//  Created by ivs on 10/30/15.
//  Copyright © 2015 ivs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoViewController;

// tao protpcol de class khac goi khi dung
@protocol DemoSelectDelegate <NSObject>

-(void) selectCtrl:(DemoViewController *) calenderCtrl selectedDate: (NSDate *)selectedDate;

-(void) dismissCtrl: (UIViewController*) popCtrl;

@end

@interface DemoViewController : UIViewController

@property (nonatomic, weak) id <DemoSelectDelegate> delegate;

@end
