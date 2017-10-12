//
//  NewsDataViewController.m
//  01-Movie
//
//  Created by Silver on 15/2/10.
//  Copyright (c) 2015年 Silver. All rights reserved.
//

#import "NewsDataViewController.h"
#import "RequestData.h"
#import "NewsDataModel.h"

@interface NewsDataViewController ()
{
    UIWebView *_webView;
}
@end

@implementation NewsDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻详情";
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];

    [self loadData];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
//    
//    [webView loadRequest:request];
    
    
//    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
//    NSString *htmlString = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
//    
//    [_webView loadHTMLString:htmlString baseURL:nil];
}

- (void)loadData{

    NSDictionary *newsDic = [RequestData loadMovieDataJSON:@"news_detail"];

    NewsDataModel *model = [[NewsDataModel alloc] init];
    
    model.title = [newsDic objectForKey:@"title"];
    model.content = [newsDic objectForKey:@"content"];
    model.time = [newsDic objectForKey:@"time"];
    model.source = [newsDic objectForKey:@"source"];
    model.author = [newsDic objectForKey:@"author"];
    model.editor = [newsDic objectForKey:@"editor"];
   
    NSString *titleStr = model.title;
    NSString *contentStr = model.content;
    NSString *timeStr = model.time;
    NSString *sourceStr = model.source;
    NSString *authorStr = model.author;
    NSString *editorStr = model.editor;
    
    //NSString *html = [NSString stringWithFormat:];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString *html = [NSString stringWithFormat:htmlString,titleStr,timeStr,contentStr,sourceStr,authorStr,editorStr];
    
    [_webView loadHTMLString:html baseURL:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
