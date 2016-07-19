//
//  YXPresentOneTransition.h
//  ViewControllerTransAnimate
//
//  Created by apple on 7/19/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,YXPresentOneTransitionType) {
	YXPresentOneTransitionTypePresent = 0,//管理present动画
	YXPresentOneTransitionTypeDismiss,//管理dismiss动画
};


@interface YXPresentOneTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign,nonatomic) YXPresentOneTransitionType type;

//根据定义的枚举初始化的两个方法
+ (instancetype)transitionWithTransitionType:(YXPresentOneTransitionType)type;
- (instancetype)initWithTransitionType:(YXPresentOneTransitionType)type;


@end
