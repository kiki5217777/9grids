//
//  ViewController.h
//  9grids
//
//  Created by 黃靖淳 on 13/8/27.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PinchViewController.h"
#import "TextViewController.h"
#import "mapViewController.h"
#import "MP4ViewController.h"
#import "YouTubeViewController.h"
#import "WebViewController.h"
#import "SnapController.h"
@interface ViewController : UIViewController{
    SnapController *TakePhoto;
}
@property (nonatomic) SnapController *TakePhoto;
- (IBAction)PinchBtn:(id)sender;
- (IBAction)TextBtn:(id)sender;
- (IBAction)MapBtn:(id)sender;
- (IBAction)MP4Btn:(id)sender;
- (IBAction)YouTubeBtn:(id)sender;
- (IBAction)WebBtn:(id)sender;
- (IBAction)PhotoBtn:(id)sender;

@end
