//
//  Screen1ViewController.m
//  DemoMJpopup
//
//  Created by ivs on 11/2/15.
//  Copyright © 2015 ivs. All rights reserved.
//

#import "Screen1ViewController.h"

@interface Screen1ViewController ()

@end

@implementation Screen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     NSString *a =  SERVER_HOST ;
    NSLog(@"%@", a);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)MoveToMain:(id)sender {
    NSLog(@"this is function Move To Main!");
//    [UIApplication sharedApplication].keyWindow.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    
    // xib call storyboard
    //[UIApplication sharedApplication].keyWindow.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
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
