//
//  ViewController.m
//  OC2_9
//
//  Created by charles on 2019/4/9.
//  Copyright © 2019 charles. All rights reserved.
//

#import "ViewController.h"
#import "EOCEmployee.h"
#import "EOCEmployeeDeveloper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //隐藏具体类型，工厂模式创建类族模式，子类实现对应方法
    EOCEmployee *employee = [EOCEmployee employeeWithType:EOCEmployeeTypeDeveloper];
    [employee doSubWork];
    
    if([employee isKindOfClass:[EOCEmployee class]]){
        //相同基类
        NSLog(@"isKindOfClass EOCEmployee");
    }
    if([employee isMemberOfClass:[EOCEmployee class]]){
        //不同实例类型
        NSLog(@"isMemberOfClass EOCEmployee");
    }
    if([employee isKindOfClass:[EOCEmployeeDeveloper class]]){
        //相同基类
        NSLog(@"isKindOfClass EOCEmployeeDeveloper");
    }
    if([employee isMemberOfClass:[EOCEmployeeDeveloper class]]){
         //相同实例类型
        NSLog(@"isMemberOfClass EOCEmployeeDeveloper");
    }

}


@end
