//
//  TOPTableViewController.m
//  01-Movie
//
//  Created by Silver on 15/2/6.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "TOPTableViewController.h"
#import "DataHeaderView.h"
#import "DataCollectionView.h"
#import "RequestData.h"
#import "TOPContentModel.h"
#import "TOPTableViewCell.h"

static NSString *identify = @"myCell";

@interface TOPTableViewController ()
{
    NSArray *_imagesArray;
    NSMutableArray *_contentArray;
    NSIndexPath *_selectIndexPath;
    NSMutableArray *_lenArray;
}

@end

@implementation TOPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影详情";
    [self loadData];
    
    
    [self initHeaderView];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

- (void)loadData{
    
    NSDictionary *josnDic = [RequestData loadMovieDataJSON:Movie_Comment];
    NSArray *array = [josnDic objectForKey:@"list"];
    
    _contentArray = [NSMutableArray array];
    _lenArray = [NSMutableArray array];
    
    for (NSDictionary *dic in array) {
        
        TOPContentModel *model = [[TOPContentModel alloc] init];
        model.userImage = [dic objectForKey:@"userImage"];
        model.nickname = [dic objectForKey:@"nickname"];
        model.rating = [dic objectForKey:@"rating"];
        model.content = [dic objectForKey:@"content"];

        NSInteger length = model.content.length;
        NSNumber *lenNum = [NSNumber numberWithInteger:length];
        [_lenArray addObject:lenNum];
        [_contentArray addObject:model];
    }
}

- (void)initHeaderView{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 240)];
    headerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    self.tableView.tableHeaderView = headerView;
    
    DataHeaderView *dhView =[[[NSBundle mainBundle] loadNibNamed:@"DataHeaderView" owner:self options:nil] lastObject];
    dhView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    dhView.frame = CGRectMake(0, 0, kScreenWidth, 140);
    [headerView addSubview:dhView];
    
    //直接赋值
    NSDictionary *josnDic = [RequestData loadMovieDataJSON:Movie_Detail];
    [dhView.image sd_setImageWithURL:[NSURL URLWithString:[josnDic objectForKey:@"image"]]];
    dhView.titleCn.text = [josnDic objectForKey:@"titleCn"];
    dhView.directors.text = [NSString stringWithFormat:@"导演：%@", [josnDic objectForKey:@"directors"][0]];
   
    //经典案例，得记住
    NSArray *actorsArray = [josnDic objectForKey:@"actors"];
    NSString *str1 = [actorsArray componentsJoinedByString:@"、"];
    dhView.actors.text = [NSString stringWithFormat:@"演员：%@", str1];
    
    NSString *str2 = @"类型：";
    NSArray *typeArray = [josnDic objectForKey:@"type"];
    NSMutableString *types = [NSMutableString stringWithString:str2];
    for (NSString *str in typeArray) {
        
        [types appendString:str];
        [types appendString:@"、"];
    }
    dhView.type.text = [NSString stringWithFormat:@"%@", types];

    dhView.location.text = [NSString stringWithFormat:@"%@",[[josnDic objectForKey:@"release"] objectForKey:@"location"]];
    dhView.date.text =  [NSString stringWithFormat:@"%@",[[josnDic objectForKey:@"release"] objectForKey:@"date"]];
    
    _imagesArray = [josnDic objectForKey:@"images"];
    
    DataCollectionView *dataCollectionView = [[DataCollectionView alloc] initWithFrame:CGRectMake(2, 147, kScreenWidth - 4, 90)];
    dataCollectionView.imagesArray = _imagesArray;
    [headerView addSubview:dataCollectionView];
    
    //设置图片的边角
    dataCollectionView.layer.cornerRadius = 5;
    dataCollectionView.layer.borderColor = [[UIColor whiteColor] CGColor];
    dataCollectionView.layer.borderWidth = 1;
    dataCollectionView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TOPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    cell.model = _contentArray[indexPath.item];
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    _selectIndexPath = indexPath;
    // 刷新指定的cell
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath == _selectIndexPath) {
        
        TOPContentModel *model = _contentArray[indexPath.row];
        NSString *content = model.content;
        
        // 计算文本在label上显示的高度
        UIFont *font = [UIFont systemFontOfSize:17.0];
        CGRect contentRect = [content boundingRectWithSize:CGSizeMake(220, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:NULL];
        
        CGFloat cellHeight = contentRect.size.height + 30;
        
        if (cellHeight > 87) {
            
            return cellHeight;
        }
    }
    
    return 87;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
