//
//  EOCNeworkFetcher.h
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EOCNeworkFetcher;//向前声明
NS_ASSUME_NONNULL_BEGIN

///委托协议与委托对象放在一起
@protocol EOCNeworkFetcherDelegate
-(void) networkFetcher:(EOCNeworkFetcher*) fetcher didReceiveData:(NSData *)data;

@optional
-(void) networkFetcher:(EOCNeworkFetcher*) fetcher doneReceiveData:(NSData *)data;

@end

@interface EOCNeworkFetcher : NSObject
@property (nonatomic, weak) id<EOCNeworkFetcherDelegate> delegate;
@end



NS_ASSUME_NONNULL_END
