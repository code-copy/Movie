//
//  MovieDataService.m
//  WXMove_demo
//
//  Created by king_linfu on 14-11-17.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "MovieDataService.h"

@implementation MovieDataService

+ (id)requestDataService:(NSString *)fileName
{
    // 文件路劲
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    
    // 文件转为Data格式
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    // JSON解析
    id jsonData = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableContainers error:nil];
    
    return jsonData;
}


@end
