//
//  ViewController.m
//  ViewControllerTransAnimate
//
//  Created by apple on 7/19/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	
	
}



- (IBAction)btnClicked:(id)sender {
	
	
	SecondViewController *secVC = [[SecondViewController alloc] init];
	[self presentViewController:secVC animated:YES completion:nil];
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
