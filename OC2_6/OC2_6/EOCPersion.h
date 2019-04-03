//
//  EOCPersion.h
//  OC2_6
//
//  Created by charles on 2019/4/3.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface EOCPersion : NSObject
//@property语法会在编译期自动合成存取方法，同时生成适当类型的实例变量（属性名前面加下划线当做实例变量名）
@property NSString *firstName;
@property NSString *lastName;
@property NSInteger age;

/**
 属性的特性用来告诉编译器进行如何操作
 原子性
    *nonatomic 非原子操作，不使用同步锁，多线程并发访问会提高访问效率
    *atomic 原子操作，加同步锁，提供多线程安全，只在其setter或getter方法时加锁安全机制，其他的线程安全不负责
 属性默认的是原子操作，但是一般开发使用非原子操作。因为关于线程安全，只是依赖原子操作根本实现不了。
 读写
    *readwrite 创建存取方法
    *readonly  只创建获取方法
 内存管理
    *assign 修饰基础数据类型以及C数据类型。
    *strong 修饰OC对象，尤其为可变类型的属性必须使用strong修饰，它不会生成新的内存地址，会使引用计数加1。
    *weak 修饰OC对象，在对象被销毁时会被置为nil。(delegate一般使用weak)
    *unsafe_unretained 修饰OC对象，在对象被销毁时不会置nil
    *copy 一般用来修饰不可变类型对象以及block，它会生成新的内存地址，但不会对原对象的引用计数发生变化。
 */

//assign
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) BOOL isOK;

//strong
@property (nonatomic, strong) id objectA;
@property (nonatomic, strong) UIViewController *viewController;

//weak
@property (nonatomic, weak) id delegate;

//copy
//关于NSString为什么使用copy而不是strong关键字
//NSString是不可变类型，若其数据源为不可变类型，那么使用copy或strong等同效果；若其数据源为可变类型，当修改数据源时，使用copy修饰的字符串则不会发生改变，但是使用strong修饰的会因为数据源变化而变化。关键在于copy会生成新的内存地址，strong则指向同一个内存地址。
@property (nonatomic, readonly, copy) NSString *parentName;
@property (nonatomic, readwrite, copy) void (^callback)(NSString*);

-(instancetype) initWithParentName:(NSString *)name;
-(NSString *)fullName;
@end

NS_ASSUME_NONNULL_END
