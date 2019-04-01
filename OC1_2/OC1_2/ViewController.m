//
//  ViewController.m
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import "ViewController.h"
#import "EOCPerson.h"
@interface ViewController ()
@property (nonatomic, strong) EOCPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.person = [[EOCPerson alloc] init];
    [self.person enterEmployer];
}


@end
