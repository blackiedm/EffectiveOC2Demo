//
//  EOCPerson.m
//  OC2_8
//
//  Created by charles on 2019/4/4.
//  Copyright © 2019 charles. All rights reserved.
//

#import "EOCPerson.h"

@implementation EOCPerson
//自定义对象判断等同性关键方法：isEqual 和 hash
- (BOOL)isEqual:(id)object{
   
    //判断类型是否一样(看情况而定)
    if([self class] == [object class]){
        return [self isEualToPerson:(EOCPerson *)object];
    }else{
        return [super isEqual:object];
    }
}
- (BOOL) isEualToPerson:(EOCPerson *)other{
    //判断相同指针地址，则为同一个对象
    if(self == other) return YES;
    //判断属性值是否相等
    if(![_firstName isEqualToString:other.firstName]){
        return NO;
    }
    if(![_lastName isEqualToString:other.lastName]){
        return NO;
    }
    if(_age != other.age){
        return NO;
    }
    return YES;
}
//根据等同性约定：若两对象相等，则其哈希码也相等；但是两个哈希码相同的对象却未必相等。
- (NSUInteger)hash{
    NSUInteger fhash = [_firstName hash];
    NSUInteger lhash = [_lastName hash];
    NSUInteger ahash = _age;
    // ^ :位异或 第一个操作数的的第n位于第二个操作数的第n位相反，那么结果的第n为也为1，否则为0
    return fhash ^ lhash ^ ahash;
}
@end
