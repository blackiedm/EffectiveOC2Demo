//
//  ViewController.m
//  OC1_4
//
//  Created by charles on 2019/4/2.
//  Copyright © 2019 charles. All rights reserved.
//

#import "ViewController.h"

//预处理指令定义的常量没有类型信息，并且会把所有ANIMATION_DURATION都进行替换
#define ANIMATION_DURATION 0.3
//定义常量正确方式：使用static const
//试图修改const修饰符所声明的变量，编译器会报错
//static修饰符意味着该变量仅在定义此变量的编译单元（.m文件）中可见
//若局限在某实现文件内，则在前面加字母k
static const NSTimeInterval kAnimationDuration = 0.3;
static NSString* const kAnimationNotificatino = @"kAnimationNotificatinon";

NSString *const EOCViewControllerDidAnimationNotification = @"EOCViewControllerDidAnimationNotification";
const NSTimeInterval EOCViewControllerAnimationDuration = 0.5;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"animation duration:%@",@(kAnimationDuration));
}


@end
