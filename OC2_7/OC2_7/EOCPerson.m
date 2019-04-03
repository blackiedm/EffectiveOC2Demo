//
//  EOCPerson.m
//  OC2_7
//
//  Created by charles on 2019/4/3.
//  Copyright © 2019 charles. All rights reserved.
//

#import "EOCPerson.h"
#import "EOCBrain.h"
@interface EOCPerson(){
    EOCBrain *_brain;
}
@end

@implementation EOCPerson

//特殊情况
//初始化总是应该直接访问实例变量，避免子类覆写其设置方法
-(instancetype) initWithFullname:(NSString *)name{
    NSArray *components = [name componentsSeparatedByString:@" "];
    if(self = [super init]){
        _firstName = [[components objectAtIndex:0] copy];
        _lastName = [[components objectAtIndex:1] copy];
    }
    return self;
}
//懒性初始化，必须通过‘获取方法’来访问属性。如果某属性不常用且创建成本较高，则应该使用懒加载
-(EOCBrain *)brain{
    if(!_brain){
        _brain = [[EOCBrain alloc] init];
    }
    return _brain;
}

-(void) didBrainTest{
//    //直接访问实例变量，可能会出现没有初始化
//    [_brain testSomething];
    //懒性初始化的属性，应该调用获取方法来访问
    [[self brain] testSomething];
}

//建议在读取实例变量时候采用直接访问形式，在设置实例变量时候通过属性存取方法来做
//直接访问实例变量速度快；不会调用其`设置方法`，绕过相关属性所定义的内存管理语义；不会触发KVO通知
-(NSString *)fullName{
    return [NSString stringWithFormat:@"%@ %@",_firstName,_lastName];
}
//通过属性访问有助于排查与之相关的错误，可增加断点来监控该属性的调用者及访问时机
- (void)setFullName:(NSString *)name{
    NSArray *components = [name componentsSeparatedByString:@" "];
    self.firstName = [components objectAtIndex:0];
    self.lastName = [components objectAtIndex:1];
}


@end
