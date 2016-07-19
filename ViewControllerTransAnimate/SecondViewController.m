//
//  SecondViewController.m
//  ViewControllerTransAnimate
//
//  Created by apple on 7/19/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "SecondViewController.h"
#import "YXPresentOneTransition.h"
@interface SecondViewController ()<UIViewControllerTransitioningDelegate>



@end

@implementation SecondViewController

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.transitioningDelegate = self;
		self.modalPresentationStyle = UIModalPresentationCustom;
		self.view.backgroundColor = [UIColor redColor];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
	
	
	return [YXPresentOneTransition transitionWithTransitionType:YXPresentOneTransitionTypePresent];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
	return  [YXPresentOneTransition transitionWithTransitionType:YXPresentOneTransitionTypeDismiss];
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
