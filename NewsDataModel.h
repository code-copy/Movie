//
//  NewsDataModel.h
//  01-Movie
//
//  Created by Silver on 15/2/10.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDataModel : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *content;
@property (nonatomic, strong)NSString *time;
@property (nonatomic, strong)NSString *source;
@property (nonatomic, strong)NSString *author;
@property (nonatomic, strong)NSString *editor;

@end
