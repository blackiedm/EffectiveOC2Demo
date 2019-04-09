//
//  EOCEmployee.m
//  OC2_9
//
//  Created by charles on 2019/4/9.
//  Copyright © 2019 charles. All rights reserved.
//

#import "EOCEmployee.h"
#import "EOCEmployeeDeveloper.h"
@implementation EOCEmployee
+ (EOCEmployee *)employeeWithType:(EOCEmployeeType)type{
    switch (type) {
        case EOCEmployeeTypeDeveloper:
                return [EOCEmployeeDeveloper new];
            break;
        case EOCEmployeeTypeDesigner:
        case EOCEmployeeTypeFinance:
            break;
    }
    return [EOCEmployeeDeveloper new];
}
- (void)doSubWork{
    NSLog(@"doSubWork-EOCEmployee");
}
@end
