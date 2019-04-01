//
//  EOCPerson.h
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "EOCEmployer.h"  不够优雅，编译并使用EOCPerson类文件时，不需要知道EOCEmployer类全部细节，只需要知道有一个类名叫EOCEmployer就行；
@class EOCEmployer; ///向前声明（forward declaring），把该类名告诉编译器
//将引入头文件的时机尽量延后，只有在确认使用时才引入，减少类的使用者引入头文件数量（减少编译时间）
//解决两个类相互引用的问题（如果在各自头文件中引入对方的头文件，则会导致’循环引用‘，意味着两个类中有一个无法被正确编译）
NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson : NSObject
@property (nonatomic,copy) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;
@property (nonatomic,strong) EOCEmployer *employer;
-(void) enterEmployer;
@end


NS_ASSUME_NONNULL_END
