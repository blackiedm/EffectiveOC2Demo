//
//  ViewController.h
//  OC1_5
//
//  Created by charles on 2019/4/2.
//  Copyright © 2019 charles. All rights reserved.
//

#import <UIKit/UIKit.h>

//枚举1
typedef NS_ENUM(NSUInteger, EOCConnectionState) {
    EOCConnectionStateDisconnected,
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected
};
//使用NS_OPTIONS定义按位或操作的枚举，对1左移
typedef NS_OPTIONS(int, EOCPermitted) {
    EOCPermittedUp      = 1 << 0,
    EOCPermittedDown    = 1 << 1,
    EOCPermittedLeft    = 1 << 2,
    EOCPermittedRight   = 1 << 3
};
//枚举2
typedef enum:NSUInteger {
    GeoUserStateUnkown,
    GeoUserStateEnter,
    GeoUserStateExit
} GeoUserState;

@interface ViewController : UIViewController


@end

