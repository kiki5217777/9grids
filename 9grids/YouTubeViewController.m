//
//  YouTubeViewController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/28.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "YouTubeViewController.h"

@interface YouTubeViewController ()

@end

@implementation YouTubeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(50, 50, 240, 160)];
    NSString *youtubeHTML = @"<iframe width=\"420\" height=\"315\" src=\"http://www.youtube.com/embed/HzMHdX8gn2A\" frameborder=\"0\" allowfullscreen></iframe>";
    [webView loadHTMLString:youtubeHTML baseURL:nil];
    [self.view addSubview:webView];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
