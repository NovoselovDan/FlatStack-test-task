//
//  NetManager.h
//  VKFeed
//
//  Created by Daniil Novoselov on 10.05.16.
//  Copyright © 2016 Daniil Novoselov. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetManager : AFHTTPSessionManager

+ (NetManager *)sharedManager;

- (NSURL *)getAuthURL;

@end
