//
//  ViewController.m
//  OC2_8
//
//  Created by charles on 2019/4/4.
//  Copyright © 2019 charles. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString * a = @"test a";
    NSString * b = [NSString stringWithFormat:@"test %@",@"a"];
    //判断指针，但不判断指针值
    NSLog(@"a == b? %@",@(a == b));
    //判断类型，且判断指针值
    NSLog(@"a isEqual b? %@",@([a isEqual:b]));
    //直接判断指针值
    NSLog(@"a isEqualString b? %@",@([a isEqualToString:b]));
    
}


@end
