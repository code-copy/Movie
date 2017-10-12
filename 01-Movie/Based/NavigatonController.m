//
//  NavigatonController.m
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "NavigatonController.h"

@interface NavigatonController ()

@end

@implementation NavigatonController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    //修改导航栏的背景
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64.png"] forBarMetrics:UIBarMetricsDefault];
    
    //修改标题颜色和字号
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}];
    
    //设置导航栏按钮字体颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

//设置状态栏(电池那一块，只有两种)
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
