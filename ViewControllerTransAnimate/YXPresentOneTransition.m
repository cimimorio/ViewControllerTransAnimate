//
//  YXPresentOneTransition.m
//  ViewControllerTransAnimate
//
//  Created by apple on 7/19/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "YXPresentOneTransition.h"

#import <UIKit/UIKit.h>

@interface YXPresentOneTransition ()



@end

@implementation YXPresentOneTransition

+(instancetype)transitionWithTransitionType:(YXPresentOneTransitionType)type{
	
	YXPresentOneTransition *transition = [[YXPresentOneTransition alloc] initWithTransitionType:type];
	return transition;
}

-(instancetype)initWithTransitionType:(YXPresentOneTransitionType)type{
	if (self = [super init]) {
		_type = type;
	}
	return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
	return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
	
	switch (_type) {
		case YXPresentOneTransitionTypePresent:{
			[self presentAnimation:transitionContext];
		}break;
		case YXPresentOneTransitionTypeDismiss:{
			[self dismissAnimation:transitionContext];
		}break;
  default:
			break;
	}
	
}


//实现present动画逻辑代码
- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
	
	//通过viewControllerForKey取到转场前后的两个控制器formVC和toVC
	UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	//snapshotViewAfterScreenUpdates可以对某个视图截图,采用对这个截图做动画代替直接对vc1做动画，因为在手势过渡中直接使用vc1动画会和手势有冲突,如果不需要实现手势的话，就可以不是用截图视图了
	UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
	tempView.frame = fromVC.view.frame;
	//是对tempView做操作,fromVC的view可以隐藏
	fromVC.view.hidden = YES;
	UIView *containerView = [transitionContext containerView];
	//将截图视图跟要推出的视图都放入containerView中
	[containerView addSubview:tempView];
	[containerView addSubview:toVC.view];
	//设置要退出视图的frame
	toVC.view.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, 400);
	[UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1.0 / 0.55 options:0 animations:^{
		//首先我们让vc2向上移动
		toVC.view.transform = CGAffineTransformMakeTranslation(0, -400);
		//然后让截图视图缩小一点即可
		tempView.transform = CGAffineTransformMakeScale(0.85, 0.85);
	} completion:^(BOOL finished) {
		//使用如下代码标记整个转场过程是否正常完成[transitionContext transitionWasCancelled]代表手势是否取消了，如果取消了就传NO表示转场失败，反之亦然，如果不用手势present的话直接传YES也是可以的，但是无论如何我们都必须标记转场的状态，系统才知道处理转场后的操作，否者认为你一直还在转场中，会出现无法交互的情况，切记！
		[transitionContext completeTransition:![transitionContext transitionWasCancelled]];
		//转场失败后的处理
		if ([transitionContext transitionWasCancelled]) {
			//失败后，我们要把vc1显示出来
			fromVC.view.hidden = NO;
			//然后移除截图视图，因为下次触发present会重新截图
			[tempView removeFromSuperview];
		}
	}];
	
	
}
//实现dismiss动画逻辑代码
- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
	
}


@end
