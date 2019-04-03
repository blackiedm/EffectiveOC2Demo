//
//  ViewController.m
//  OC2_7
//
//  Created by charles on 2019/4/3.
//  Copyright © 2019 charles. All rights reserved.
//

#import "ViewController.h"
#import "EOCPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EOCPerson *person = [[EOCPerson alloc] initWithFullname:@"charles yang"];
    NSString *fullname = person.fullName;
    NSLog(@"full name:%@",fullname);
    [person didBrainTest];
}


@end
