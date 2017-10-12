//
//  CinemaViewController.h
//  01-Movie
//
//  Created by Silver on 15/1/29.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaViewController : FatherViewController<UITableViewDataSource,UITableViewDelegate>
{

    IBOutlet UITableView *_cinemaTableView;
}

@end
