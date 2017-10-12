//
//  CinemaViewController.m
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaTableViewCell.h"
#import "RequestData.h"
#import "CinemaModel.h"

static NSString *identify = @"Cell";

@interface CinemaViewController ()
{
    BOOL _flag[20];    
    NSArray *_nameArray;
    NSMutableArray *_array;

    NSMutableDictionary *_dataDic;
}

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cinemaTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _cinemaTableView.sectionFooterHeight = 0;
    _cinemaTableView.sectionHeaderHeight = 35;
    _cinemaTableView.rowHeight = 95;
    _cinemaTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self loadData];
}
- (void)loadData{

    //取出地区
    NSDictionary *nameDic = [RequestData loadMovieDataJSON:District_List];
    _nameArray = [nameDic objectForKey:@"districtList"];
    
    //取出影院
    NSDictionary *dataDic = [RequestData loadMovieDataJSON:Cinema_List];
    NSArray *dataArray = [dataDic objectForKey:@"cinemaList"];
    
    _dataDic = [[NSMutableDictionary alloc] init];
    
    //电影院和地址一一配对
    for (NSDictionary *dic in _nameArray) {
        
         _array = [NSMutableArray array];
        
        NSString *str = [dic objectForKey:@"id"];
        
        for (NSDictionary *dict in dataArray) {
            
            if ([str isEqualToString:[dict objectForKey:@"districtId"]]) {
                
                CinemaModel *model = [[CinemaModel alloc] init];
                model.name = [dict objectForKey:@"name"];
                model.lowPrice = [dict objectForKey:@"lowPrice"];
                model.grade = [dict objectForKey:@"grade"];
                model.distance = [dict objectForKey:@"distance"];
                model.address = [dict objectForKey:@"address"];
                model.isSeatSupport = [dict objectForKey:@"isSeatSupport"];
                model.isCouponSupport = [dict objectForKey:@"isCouponSupport"];
                
                [_array addObject:model];
            }
        }
        
        NSString *key = [dic objectForKey:@"name"];
                
        [_dataDic setObject:_array forKey:key];        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _nameArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *str = [_nameArray[section] objectForKey:@"name"];
    
    NSArray *array = [_dataDic objectForKey:str];

    BOOL f = _flag[section];
    
    if (f) {
        return array.count;
    }else{
        
    return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    
    NSString *str = [_nameArray[indexPath.section] objectForKey:@"name"];
    
    NSArray *array = [_dataDic objectForKey:str];
    
    cell.model = array[indexPath.row];
    
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0];

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
   // button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hotMovieBottomImage@2x.png"]];
    [button setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage@2x.png"] forState:UIControlStateNormal];
    [button setTitle:[_nameArray[section] objectForKey:@"name"] forState:UIControlStateNormal];
    button.tag = section;
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}

- (void)buttonAction:(UIButton *)button{
    
    NSInteger section = button.tag;
    
    _flag[section] = !_flag[section];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    [_cinemaTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

@end
