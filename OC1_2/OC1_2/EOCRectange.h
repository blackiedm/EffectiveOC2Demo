//
//  EOCRectange.h
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EOCShape.h"
#import "EOCDrawble.h" //这里必须要使用import声明，对应协议最好是单独一个头文件
NS_ASSUME_NONNULL_BEGIN

@interface EOCRectange : EOCShape<EOCDrawble>

@end

NS_ASSUME_NONNULL_END
