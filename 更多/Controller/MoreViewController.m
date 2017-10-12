//
//  MoreViewController.m
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "MoreViewController.h"
#import "FatherViewController.h"

static NSString *identify = @"Cell";

@interface MoreViewController ()
{
    float _cacheFileSize;
}


@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置y坐标的起始位置(设置不透明也可以)
    self.edgesForExtendedLayout  = UIRectEdgeNone;
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
   
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self countCache];
    
//    NSArray *rowsArray = [self.tableView indexPathsForVisibleRows];
//    UITableViewCell *cell =rowsArray[0];
//    UILabel *sizeLable = (UILabel *)[cell.contentView viewWithTag:100];
//    UILabel *sizeLable = (UILabel *)[cell.contentView viewWithTag:100];
//    sizeLable.text = [NSString stringWithFormat:@"%.1fM", _cacheFileSize];

}

- (void)countCache{
    
    //1,沙盒路径(找到文件路径)
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/com.hackemist.SDWebImageCache.default"];
    
    NSLog(@"%@", cachePath);
    //2,获取缓存文件
    //创建文件管理类，由他去管理文件目录
    NSFileManager *fileManger = [NSFileManager defaultManager];
    
    //获取所有子目录的文件名称
    NSArray *allFilePath = [fileManger subpathsOfDirectoryAtPath:cachePath error:nil];
    
    //3,统计所有缓存文件的大小
    //所有文件的字节大小
    long long allFileSize = 0;
    
    for (NSString *path in allFilePath) {
        
        NSString *subPath = [cachePath stringByAppendingPathComponent:path];

        NSDictionary *attributes = [fileManger attributesOfItemAtPath:subPath error:nil];
        
        //NSLog(@"%@", attributes);
        
        NSNumber *fileSize = attributes[NSFileSize];
        
        allFileSize += [fileSize longValue];
        
    }
    
    //将字节bit转换为M
    _cacheFileSize = (float)allFileSize / 1024 / 1024;
    
    
    [self.tableView reloadData];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        
        UILabel *sizeLable = (UILabel *)[cell.contentView viewWithTag:100];
        sizeLable.text = [NSString stringWithFormat:@"%.1fM", _cacheFileSize];
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否清理缓存文件" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 0) {
        
        //4,清除缓存
        [[SDImageCache sharedImageCache] clearDisk];
        
        [self countCache];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
