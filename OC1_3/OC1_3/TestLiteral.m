//
//  TestLiteral.m
//  OC1_3
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import "TestLiteral.h"

@implementation TestLiteral
/**
 字面量语法可以缩减源代码长度，使其更为易读
 使用字面量语法创建字典和数组时，若值有nil，则会抛出异常
 */
+(void)test{
    //字符串字面量
    NSString * str = @"just test";
    NSLog(@"str:%@",str);
    //字面数值（NSNumber,整数、浮点数、布尔值封装进oc对象）
    NSNumber *number = @1;
    NSNumber *number1 = @1.5f;
    NSNumber *number2 = @YES;
    NSNumber *number3 = @(2 * 2.5f);//也适合表达式
    NSLog(@"number:%@,number1:%@,number2:%@,number3:%@",number,number1,number2,number3);
    //字面量数组
    NSArray *array = @[@"A",@"B",@"B"];
    NSString *value = array[1];//取下标
    NSLog(@"value:%@",value);
    //字面量字典
    NSDictionary *dic = @{@"key0":@"value0",
                          @"key1":@YES,
                          @"key2":@1
                          };
    NSString *value1 = dic[@"key0"];//取下标
    NSLog(@"value1:%@",value1);
    //可变字典和数组可通过取下标更改值
    NSMutableArray *mutableArray = [array mutableCopy];
    mutableArray[0] = @"D";
    NSLog(@"mutableArray[0]:%@",mutableArray[0]);
    NSMutableDictionary *mutableDic = [dic mutableCopy];
    mutableDic[@"key0"] = @"value";
    NSLog(@"mutableDic[key0]:%@",mutableDic[@"key0"]);
    
    
}
@end
