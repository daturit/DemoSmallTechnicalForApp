//
//  ViewController.m
//  demoUIPopoverUIController
//
//  Created by ivs on 11/9/15.
//  Copyright © 2015 ivs. All rights reserved.
//

#import "ViewController.h"
#import "PopoverDemoViewController.h"

@interface ViewController () <UIPopoverControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *showSelected;

@property (strong, nonatomic) UIPopoverController *popup;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showPopover:(id)sender {
    
//    UIButton *btn = sender;
//    RegiReadyController *readyInputCtrl = [[RegiReadyController alloc] initWithNibName:nil bundle:nil];
//    readyInputCtrl.delegate = self;
//    
//    self.readyInputPopCtrl = [[UIPopoverController alloc] initWithContentViewController:readyInputCtrl];
//    
//    _readyInputPopCtrl.delegate = self;
//    [_readyInputPopCtrl setPopoverContentSize:CGSizeMake(350, 400)animated:YES];
//    [_readyInputPopCtrl presentPopoverFromRect:btn.frame inView:btn.superview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    UIButton *btn = sender;
    PopoverDemoViewController *popup = [[PopoverDemoViewController alloc] initWithNibName:nil bundle:nil];
    self.popup = [[UIPopoverController alloc] initWithContentViewController:popup];
    _popup.delegate = self;
    [_popup setPopoverContentSize:CGSizeMake(300, 330) animated:YES];
    [_popup presentPopoverFromRect:btn.frame inView:btn.superview permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
    
    
}

@end
