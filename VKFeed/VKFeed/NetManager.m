//
//  NetManager.m
//  VKFeed
//
//  Created by Daniil Novoselov on 10.05.16.
//  Copyright © 2016 Daniil Novoselov. All rights reserved.
//

#import "NetManager.h"
#import "constants.h"

const NSString *APPLICATION_ID = @"5421687";
@interface NetManager()

@end

@implementation NetManager


+ (NetManager *)sharedManager {
    static NetManager *_sharedNetManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNetManager = [[self alloc] initWithBaseURL:nil];
        AFJSONResponseSerializer *responeSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        [_sharedNetManager setResponseSerializer:responeSerializer];
        
    });
    return _sharedNetManager;
}


- (NSURL *)getAuthURL {
    NSString *redirectURI = @"https://oauth.vk.com/blank.html";
    NSString *authURL = [NSString stringWithFormat:@"https://oauth.vk.com/authorize?client_id=%@&display=mobile&redirect_uri=%@&scope=friends,wall,offline&response_type=token&v=%@", APPLICATION_ID, redirectURI, API_VERSION];
    
    return [NSURL URLWithString:authURL];
}

@end
