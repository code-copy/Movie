//
//  MovieDataService.h
//  WXMove_demo
//
//  Created by king_linfu on 14-11-17.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDataService : NSObject

/**
 *  数据请求
 *
 *  @param filePath 文件民称
 *
 *  @return NSDictionary
 */
+ (id)requestDataService:(NSString *)fileName;

@end
