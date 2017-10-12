//
//  NewViewController.m
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "NewViewController.h"
#import "NewsModel.h"
#import "NewsListCell.h"
#import "NewsCollectionViewController.h"
#import "NewsDataViewController.h"

@interface NewViewController ()
{
    NSMutableArray *_newsModelArray;//新闻的model储存数组
    UIImageView *_imageView;
    
}

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载图片等数据
    [self loadNewsData];
    //设置头视图
    [self _initHeaderView];
}

//加载图片等数据
- (void)loadNewsData{

    NSArray *newsList = [RequestData loadMovieDataJSON:News_List];
    
    _newsModelArray = [NSMutableArray array];
    
    for (NSDictionary *dic in newsList) {
    
        NewsModel *model = [[NewsModel alloc] init];
        
        model.type = [dic objectForKey:@"type"];
        model.title = [dic objectForKey:@"title"];
        model.image = [dic objectForKey:@"image"];
        model.summary = [dic objectForKey:@"summary"];
        
        [_newsModelArray addObject:model];
    }
}

//设置头视图
- (void)_initHeaderView{

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    
    _imageView = [[UIImageView alloc] initWithFrame:headerView.bounds];
    _imageView.backgroundColor = [UIColor orangeColor];
    NewsModel *model = _newsModelArray[0];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    [headerView addSubview:_imageView];
    _newTableView.tableHeaderView = headerView;
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, headerView.bottom - 20, kScreenWidth, 20)];
    titleLable.text = model.title;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [titleLable setTextColor:[UIColor whiteColor]];
    [headerView addSubview:titleLable];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _newsModelArray.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NewsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newCell" forIndexPath:indexPath];
    
    cell.model = _newsModelArray[indexPath.row + 1];
    
    return cell;
}

//下拉放大头视图
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat yOffset = scrollView.contentOffset.y;

    if (yOffset < 0) {
        
        _imageView.height = 150 - yOffset;
        _imageView.top = yOffset;
        
        _imageView.width = _imageView.height / 150 * kScreenWidth;
        _imageView.left = -(_imageView.width - kScreenWidth) / 2;
        
    }
}

//判断等否推到另一个视图控制器
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *model = _newsModelArray[indexPath.row + 1];
    
    if ([model.type intValue] == 1) {

        NewsCollectionViewController *collectionCol = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsCollectionViewController"];
        
        [self.navigationController pushViewController:collectionCol animated:YES];
    }
    if ([model.type intValue] == 0) {
        
        NewsDataViewController *newDataCol = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDataViewController"];
        
         newDataCol.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:newDataCol animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
