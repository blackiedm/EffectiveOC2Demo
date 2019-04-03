//
//  EOCPersion.m
//  OC2_6
//
//  Created by charles on 2019/4/3.
//  Copyright © 2019 charles. All rights reserved.
//

#import "EOCPersion.h"

@interface EOCPersion(){
    //手动创建实例变量
    NSInteger _age;
}
@end

@implementation EOCPersion
//可在类的实现代码里，通过@synthesize来指定实例变量的名字
@synthesize firstName = _myFirstName;
@synthesize lastName = _myLastName;
//可在类的实现代码里，通过@dynamic指定编译器不要自动创建对应实例变量和存取方法。
@dynamic age;

//即使指定不同的实例变量名字，但不影响属性生成的存取方法，其值相等
-(NSString *)fullName{
    return [_myFirstName stringByAppendingString:_myLastName];
//    return [self.firstName stringByAppendingString:self.lastName];
}

//手动创建存取方法
- (void)setAge:(NSInteger)age{
    _age = age;
}
- (NSInteger)age{
    return _age;
}

//不能再init或dealloc中调用属性的存储方法
//与属性特性copy相符，需要对值进行拷贝
- (instancetype)initWithParentName:(NSString *)name{
    if(self = [super init]){
        _parentName = [name copy];
    }
    return self;
}
@end
