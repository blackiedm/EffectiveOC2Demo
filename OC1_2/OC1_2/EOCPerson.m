//
//  EOCPerson.m
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import "EOCPerson.h"
#import "EOCEmployer.h"///实现文件必须知道其所有接口细节，则需引入该类
@implementation EOCPerson
-(void) enterEmployer{
    if(!self.employer){
        self.employer = [[EOCEmployer alloc] init];
    }
    [self.employer printStr];
}
@end
