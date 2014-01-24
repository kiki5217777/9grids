//
//  ViewController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/27.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize TakePhoto;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PinchBtn:(id)sender {
    PinchViewController *pinchView = [[PinchViewController alloc]init];
    [self.navigationController pushViewController:pinchView animated:YES];
    pinchView.title = @"縮放";
}

- (IBAction)TextBtn:(id)sender {
    TextViewController *textView = [[TextViewController alloc]init];
    [self.navigationController pushViewController:textView animated:YES];
    textView.title =@"文字";
}

- (IBAction)MapBtn:(id)sender {
    mapViewController *mapView = [[mapViewController alloc]init];
    [self.navigationController pushViewController:mapView animated:YES];
    mapView.title =@"地圖";
}

- (IBAction)MP4Btn:(id)sender {
    MP4ViewController *mp4View = [[MP4ViewController alloc]init];
    [self.navigationController pushViewController:mp4View animated:YES];
    mp4View.title =@"MP4";
}

- (IBAction)YouTubeBtn:(id)sender {
    YouTubeViewController *youtubeView = [[YouTubeViewController alloc]init];
    [self.navigationController pushViewController:youtubeView animated:YES];
    youtubeView.title =@"YouTube";
}

- (IBAction)WebBtn:(id)sender {
    WebViewController *webView = [[WebViewController alloc]init];
    [self.navigationController pushViewController:webView animated:YES];
    webView.title =@"Web";

}

- (IBAction)PhotoBtn:(id)sender {
    
    SnapController *photoView = [[SnapController alloc]init];
    [self.navigationController pushViewController:photoView animated:YES];
    photoView.title =@"Take a Photo";
    
}
-(void) selectLeftAction{
    NSLog(@"snap");
}
@end
