//
//  WebAuthorizationViewController.m
//  VKFeed
//
//  Created by Daniil Novoselov on 09.05.16.
//  Copyright © 2016 Daniil Novoselov. All rights reserved.
//

#import "WebAuthorizationViewController.h"
#import "NetManager.h"

@interface WebAuthorizationViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebAuthorizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *authRequest = [NSURLRequest requestWithURL:[[NetManager sharedManager] getAuthURL]];
    [[self webView] loadRequest:authRequest];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"WebViewURL: %@", webView.request.URL.absoluteString);
    NSLog(@"TOKEN = %@", [self getTokenFromURL:webView.request.URL]);
    if ([webView.request.URL.absoluteString containsString:@"access_token="]) {
        NSString *token = [self getTokenFromURL:webView.request.URL];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"access_token"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (NSString *)getTokenFromURL:(NSURL *)URL {
    NSString *url = URL.absoluteString;
    url = [url componentsSeparatedByString:@"#"].lastObject;
    for (NSString *param in [url componentsSeparatedByString:@"&"]) {
        if ([param containsString:@"access_token="]) {
            return [param componentsSeparatedByString:@"="].lastObject;
        }
    }
    return nil;
}
@end
