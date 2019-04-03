//
//  ViewController.m
//  OC2_6
//
//  Created by charles on 2019/4/3.
//  Copyright © 2019 charles. All rights reserved.
//

#import "ViewController.h"
#import "EOCPersion.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EOCPersion *persion = [[EOCPersion alloc] init];
    //要访问属性，可使用点语法
    persion.firstName = @"aaaa";
    NSString *firstName = persion.firstName;
    NSLog(@"firstName:%@",firstName);
    //也可直接使用存取方法
    [persion setLastName:@"bbbb"];
    NSString *lastName = [persion lastName];
    NSLog(@"lastName:%@",lastName);
    NSString *fullName = [persion fullName];
    NSLog(@"fullName:%@",fullName);
    //该属性使用了@dynamic，不会出自定创建存取方法，需要自己创建
    persion.age = 12;
    NSLog(@"age:%@",@(persion.age));
}


@end
