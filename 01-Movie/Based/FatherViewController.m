//
//  FatherViewController.m
//  01-Movie
//
//  Created by Silver on 15/1/30.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "FatherViewController.h"

@interface FatherViewController ()

@end

@implementation FatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置y坐标的起始位置(设置不透明也可以)
    self.edgesForExtendedLayout  = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
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
