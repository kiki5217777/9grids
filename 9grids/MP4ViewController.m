//
//  MP4ViewController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/28.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "MP4ViewController.h"

@interface MP4ViewController ()

@end

@implementation MP4ViewController

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
    // Do any additional setup after loading the view from its nib.
    NSString *thePath =[[NSBundle mainBundle]pathForResource:@"shortview" ofType:@"mp4"];
    NSLog(@"thePath%@",thePath);
    NSURL *theUrl = [NSURL fileURLWithPath:thePath];
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:theUrl];
    [moviePlayer setMovieSourceType:MPMovieSourceTypeFile];
    [moviePlayer.view setFrame:CGRectMake(50, 50, 240, 160)];
    [moviePlayer prepareToPlay];
    [moviePlayer setShouldAutoplay:NO];
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playBackFinish) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
}
-(void) playBackFinish {
    [moviePlayer stop];
    [moviePlayer prepareToPlay];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
