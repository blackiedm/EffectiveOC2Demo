//
//  ViewController.m
//  OC1_5
//
//  Created by charles on 2019/4/2.
//  Copyright © 2019 charles. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //按位或操作
    EOCPermitted permitted = EOCPermittedUp | EOCPermittedDown;
    NSLog(@"enum << :%@",@(permitted));
    //在处理枚举类型的switch语句中不要实现defualt分支。这样若有枚举没有处理，编译器则会报警
    GeoUserState state = GeoUserStateUnkown;
    switch (state) {
        case GeoUserStateUnkown:
        case GeoUserStateEnter:
        case GeoUserStateExit:
        NSLog(@"GeoUserState :%@",@(state));
        break;
    }
}


@end
