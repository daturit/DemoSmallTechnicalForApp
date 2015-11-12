//
//  ViewController.m
//  SmoothLineDemo
//
//  Created by ivs on 11/12/15.
//  Copyright © 2015 ivs. All rights reserved.
//

#import "ViewController.h"
#import "CoreMotion/CoreMotion.h"


@interface ViewController ()
@property (nonatomic) SmoothLineView *canvas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SmoothLineView *smoothLineView = [[SmoothLineView alloc] initWithFrame:self.view.bounds];
    self.canvas = smoothLineView;
    [self.view addSubview:smoothLineView];
    NSLog(@"this is view did load!");
    
}

-(BOOL) canBecomeFirstResponder{
    return YES;
    
}

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
    [self.canvas clear];
    NSLog(@"this is motion Begin");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
