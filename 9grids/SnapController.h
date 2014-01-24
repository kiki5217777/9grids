//
//  SnapController.h
//  9grids
//
//  Created by 黃靖淳 on 13/8/29.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fmdbOP.h"
#define COOKBOOK_PURPLE_COLOR	[UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR) 	[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define RESIZABLE(_VIEW_)   [_VIEW_ setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth]
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
@interface SnapController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate, UIPopoverControllerDelegate>{
    UIImageView *imageView;
    UIImagePickerController *imagePickerController;
    UIPopoverController *popoverController;
    fmdbOP *PhotoDB;
}
@end
