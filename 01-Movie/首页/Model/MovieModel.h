//
//  MovieModel.h
//  01-Movie
//
//  Created by Silver on 15/1/30.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
/*
 
 */

@property (strong, nonatomic)NSDictionary *rating;
@property (strong, nonatomic)NSString *title;
@property (strong, nonatomic)NSString *oringinal_title;
@property (strong, nonatomic)NSString *year;
@property (strong, nonatomic)NSDictionary *images;

@end
