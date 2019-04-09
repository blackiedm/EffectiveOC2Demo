//
//  EOCEmployee.h
//  OC2_9
//
//  Created by charles on 2019/4/9.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum:NSUInteger {
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance
} EOCEmployeeType;

@interface EOCEmployee : NSObject
//工厂模式创建类族，隐藏抽象基类背后实现细节。
+ (EOCEmployee *) employeeWithType:(EOCEmployeeType) type;
//子类继承实现
-(void) doSubWork;
@end

NS_ASSUME_NONNULL_END
