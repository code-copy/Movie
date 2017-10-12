//
//  HomeViewController.m
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "HomeViewController.h"
#import "MovieModel.h"
#import "MovieListCell.h"
#import "PostView.h"
#import "PostCollectionView.h"

@interface HomeViewController ()
{
    UITableView *_movieTableView;//
    UIView *_postView;//第一个隐藏页面
    NSMutableArray *_movieModelArray;//存储model的数据
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatRightItem];
    [self _initViews];
    
    //加载数据
    [self loadMovieData];
    
    PostView *postView = [[PostView alloc] init];
    postView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
    postView.modelArry = _movieModelArray;
    [_postView addSubview:postView];
}

//创建右边的按钮
- (void)creatRightItem{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 35);
    [button setImage:[UIImage imageNamed:@"list_home.png"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"poster_home.png"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

//创建view
- (void)_initViews{

    _movieTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49)];
    _movieTableView.backgroundColor = [UIColor clearColor];
    _movieTableView.rowHeight = 120;
    
    _movieTableView.dataSource = self;
    _movieTableView.delegate = self;
    
    UINib *nib = [UINib nibWithNibName:@"MovieListCell" bundle:nil];
    [_movieTableView registerNib:nib forCellReuseIdentifier:@"myCell"];
    
    [self.view addSubview:_movieTableView];
    
    _postView = [[UIView alloc] initWithFrame:_movieTableView.bounds];
    _postView.hidden = YES;
    [self.view addSubview:_postView];

}

- (void)loadMovieData{

    id jsonDic = [RequestData loadMovieDataJSON:Us_Box];
    
    NSArray *movieList = [jsonDic objectForKey:@"subjects"];

    //用于保存model数据
    _movieModelArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in movieList) {
       
        NSDictionary *movieDic = [dic objectForKey:@"subject"];
        
        MovieModel *model = [[MovieModel alloc] init];
        
        model.rating = [movieDic objectForKey:@"rating"];
        model.title = [movieDic objectForKey:@"title"];
        model.oringinal_title = [movieDic objectForKey:@"original_title"];
        model.year = [movieDic objectForKey:@"year"];
        model.images = [movieDic objectForKey:@"images"];
        
        [_movieModelArray addObject:model];
    }
}

//确定tableView的组数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _movieModelArray.count;
}
//创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MovieListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    cell.model = _movieModelArray[indexPath.row];
    
    return cell;
}

//按钮点击功能实现
- (void)rightItemAction:(UIButton *)button{
    
    //button的选中状态
    button.selected = !button.selected;
    
    //view的隐藏取反
    _movieTableView.hidden = !_movieTableView.hidden;
    _postView.hidden = !_postView.hidden;
    
    //调用动画方法
    [self filpView:self.view withIsLeft:_movieTableView.hidden];
    [self filpView:button withIsLeft:button.selected];
}

//执行动画
- (void)filpView:(UIView *)view withIsLeft:(BOOL)isLeft{

    //判断左转还是右转
    UIViewAnimationOptions option = isLeft ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:view duration:0.5 options:option animations:^{
    //执行动画时所做的事
    
    } completion:^(BOOL finished) {
    //执行完动画所做的事
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
