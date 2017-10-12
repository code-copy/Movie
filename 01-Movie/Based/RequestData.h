//
//  RequestData.h
//  01-Movie
//
//  Created by Silver on 15/1/31.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestData : NSObject

+ (id)loadMovieDataJSON:(NSString *)fileName;

@end
