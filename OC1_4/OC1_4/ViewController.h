//
//  ViewController.h
//  OC1_4
//
//  Created by charles on 2019/4/2.
//  Copyright © 2019 charles. All rights reserved.
//

#import <UIKit/UIKit.h>
//若常量在类之外，则通常以类名为前缀
//static const NSTimeInterval EOCViewControllerAnimationDuration = 0.3;
//extern关键字告诉编译器，向全局符号表中注册一个符号（编译器无需查看其定义，直接代码使用该常量，当链接成二进制文件之后，编译器会在数据段为字符串分配空间）
extern const NSTimeInterval EOCViewControllerAnimationDuration;
extern NSString* const EOCViewControllerDidAnimationNotification;

@interface ViewController : UIViewController


@end

