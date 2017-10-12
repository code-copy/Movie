//
//  CinemaModel.h
//  01-Movie
//
//  Created by Silver on 15/2/9.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModel : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *grade;
@property (nonatomic, strong)NSString *address;
@property (nonatomic, strong)NSString *isSeatSupport;
@property (nonatomic, strong)NSString *isCouponSupport;
@property (nonatomic, strong)NSString *lowPrice;
@property (nonatomic, strong)NSString *distance;

@end
