//
//  PinchViewController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/27.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

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
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    scrollview.backgroundColor = [UIColor clearColor];
    scrollview.delegate = self;
    scrollview.bounces = NO;
    
    image = [UIImage imageNamed:@"Niagara Falls.jpg"];
    imgView = [[UIImageView alloc]initWithImage:image];
    scrollview.contentSize = imgView.frame.size;
    [scrollview addSubview:imgView];
    scrollview.minimumZoomScale = scrollview.frame.size.width/ imgView.frame.size.width;
    scrollview.maximumZoomScale = 2.0;
    [scrollview setZoomScale:scrollview.minimumZoomScale];
    self.view = scrollview;
    
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imgView;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
