//
//  NewsViewController.m
//  VKFeed
//
//  Created by Daniil Novoselov on 09.05.16.
//  Copyright © 2016 Daniil Novoselov. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _navItem.hidesBackButton = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationItem.backBarButtonItem = nil;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
