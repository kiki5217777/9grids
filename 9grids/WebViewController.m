//
//  WebViewController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/28.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

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
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com.tw"]];
    [self.view addSubview:webView];
    [webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
