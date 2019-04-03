//
//  EOCPerson.h
//  OC2_7
//
//  Created by charles on 2019/4/3.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
-(instancetype) initWithFullname:(NSString *)name;
-(NSString *)fullName;
-(void) setFullName:(NSString *)name;
-(void) didBrainTest;
@end

NS_ASSUME_NONNULL_END
