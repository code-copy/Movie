//
//  NewsModel.h
//  01-Movie
//
//  Created by Silver on 15/1/31.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic,strong)NSNumber *type;
@property (nonatomic,strong)NSString *image;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *summary;

@end
