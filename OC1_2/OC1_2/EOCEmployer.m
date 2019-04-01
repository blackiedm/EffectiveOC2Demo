//
//  EOCEmployer.m
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import "EOCEmployer.h"
#import "EOCPerson.h"
@implementation EOCEmployer
-(void) printStr{
    [self addEmployer:[[EOCPerson alloc] init]];
    NSLog(@"do employer");
}
- (void)addEmployer:(EOCPerson *)person{
    NSLog(@"add employer");
}
@end
