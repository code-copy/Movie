//
//  RequestData.m
//  01-Movie
//
//  Created by Silver on 15/1/31.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "RequestData.h"

@implementation RequestData

+ (id)loadMovieDataJSON:(NSString *)fileName{

    //1.找到文件存放路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    
    //2.获取文件内容
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    //3.数据解析(字典)
    id jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    return jsonDic;
    
}

@end
