//
//  MovieItem.h
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieItem : UIControl

/**
 *  创建tabBaritem
 *
 *  @param frame
 *  @param imageName item图片
 *  @param title     item标题
 *
 *  @return
 */
- (id)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;

@end
