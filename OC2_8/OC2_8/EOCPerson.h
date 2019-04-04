//
//  EOCPerson.h
//  OC2_8
//
//  Created by charles on 2019/4/4.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSUInteger age;
@end

NS_ASSUME_NONNULL_END
