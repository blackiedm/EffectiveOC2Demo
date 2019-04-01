//
//  EOCModel.m
//  OC1_2
//
//  Created by charles on 2019/4/1.
//  Copyright © 2019 charles. All rights reserved.
//

#import "EOCModel.h"
#import "EOCNeworkFetcher.h"
@interface EOCModel()<EOCNeworkFetcherDelegate>///使用分类遵从委托协议
@end

@implementation EOCModel

- (void)networkFetcher:(EOCNeworkFetcher *)fetcher didReceiveData:(NSData *)data{
    
}
- (void)networkFetcher:(EOCNeworkFetcher *)fetcher doneReceiveData:(NSData *)data{
    
}
@end
