//
//  LoginViewController.m
//  VKFeed
//
//  Created by Daniil Novoselov on 09.05.16.
//  Copyright © 2016 Daniil Novoselov. All rights reserved.
//

#import "LoginViewController.h"
#import "NetManager.h"

@interface LoginViewController () <SFSafariViewControllerDelegate>
@end

@implementation LoginViewController
SFSafariViewController *SafariVC;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]) {
        [self performSegueWithIdentifier:@"toNewsSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = [segue destinationViewController];
    vc.navigationItem.hidesBackButton = YES;
}

@end
