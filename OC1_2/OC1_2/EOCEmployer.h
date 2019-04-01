//
//  EOCEmployer.h
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EOCPerson;
NS_ASSUME_NONNULL_BEGIN

@interface EOCEmployer : NSObject
-(void) printStr;
-(void) addEmployer:(EOCPerson *)person;
@end

NS_ASSUME_NONNULL_END
