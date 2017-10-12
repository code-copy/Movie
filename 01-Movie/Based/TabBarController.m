//
//  TabBarController.m
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "TabBarController.h"
#import "MovieItem.h"

@interface TabBarController ()
{
    UIImageView *_selectView;
}

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义添加按钮
    [self _initTabBarItems];

}

//页面刚出现，就删除原来的按钮
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self removeTabBarItems];
    
}

//删除按钮
- (void)removeTabBarItems{

    NSArray *subViews = self.tabBar.subviews;
    
    Class itemClass = NSClassFromString(@"UITabBarButton");
    
    for (UIView *view in subViews) {
        
        if ([view isKindOfClass:[itemClass class]]) {
            
            [view removeFromSuperview];
        }
    }
}

//自定义添加按钮
- (void)_initTabBarItems{
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all.png"]];
    CGFloat itemWidth = kScreenWidth / 5;
    CGFloat itemHeigth = CGRectGetHeight(self.tabBar.frame);
    
    // 添加选中滑块
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake((itemWidth - 45) / 2, 3, 45, 45)];
    _selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [self.tabBar addSubview:_selectView];
    
    NSArray *imagesName = @[@"movie_cinema.png",
                            @"msg_new.png",
                            @"start_top250.png",
                            @"icon_cinema.png",
                            @"more_setting.png"];
    
    NSArray *titles = @[@"首页",
                        @"新闻",
                        @"TOP",
                        @"影院",
                        @"更多"];
    
    for (int i = 0; i < 5; i++) {
        
        // 子类化创建tabBarItem
        MovieItem *item = [[MovieItem alloc] initWithFrame:CGRectMake(itemWidth * i, 0, itemWidth, itemHeigth) withImageName:imagesName[i] withTitle:titles[i]];
        
        item.tag = i + 10;
        
        [item addTarget:self action:@selector(itemsAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:item];
    }

}

- (void)itemsAction:(MovieItem *)item{

    //tabBar 中的 item功能实现
    self.selectedIndex = item.tag - 10;
    
    //选中滑块的移动
    [UIView animateWithDuration:0.3 animations:^{
        _selectView.center = item.center;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
