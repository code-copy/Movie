//
//  LaunchViewController.m
//  01-Movie
//
//  Created by Silver on 15/2/11.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 1; i < 25; i++){
        
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:i];
        NSString *imageName = [NSString stringWithFormat:@"%i.png", i];
        [imageView setImage:[UIImage imageNamed:imageName]];
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL mark = [userDefaults objectForKey:@"isFirst"];
    
    if (mark == NO) {
        
        [self showScrollView];
        
        [userDefaults setBool:YES forKey:@"isFirst"];
        
    }else{
        
      [self showImage];
    
    }
}

- (void)showScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.contentSize = CGSizeMake(kScreenWidth * 5, kScreenHeight);
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    

    
    for (int i = 0; i < 5; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        [scrollView addSubview:imageView];
        
        NSString *imageName = [NSString stringWithFormat:@"guide%i@2x.png", i + 1];
        [imageView setImage:[UIImage imageNamed:imageName]];
        
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i + 50, kScreenHeight - 50, kScreenWidth - 100, 30)];
        [scrollView addSubview:imageView1];
        
        NSString *imageName1 = [NSString stringWithFormat:@"guideProgress%i@2x.png", i + 1];
        [imageView1 setImage:[UIImage imageNamed:imageName1]];
        
        
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth * 4 + 100, kScreenHeight - 150, kScreenWidth - 200, 30)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"立即进入" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
    
}

- (void)buttonAction{
    
    [self showMainView];

}

- (void)showImage{

    static int tag = 1;
    
    if (tag == 25) {
        
        [self showMainView];
        
        return;
    }
    
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:tag];
    imageView.alpha = 1;
    
    tag++;
    
    [self performSelector:@selector(showImage) withObject:nil afterDelay:0.3];
}

- (void)showMainView{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *mainCol = [storyboard instantiateInitialViewController];
    
    self.view.window.rootViewController = mainCol;
    
    CGAffineTransform transfom = CGAffineTransformMakeScale(0.2, 0.2);
    mainCol.view.transform = transfom;
    
    [UIView animateWithDuration:1 animations:^{
        
        mainCol.view.transform = CGAffineTransformIdentity;
    }];
//    [UIView animateWithDuration:1 animations:^{
//        
//        
//    } completion:^(BOOL finished) {
//        
//        
//    }];
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
