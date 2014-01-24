//
//  SnapController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/29.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "SnapController.h"

@implementation SnapController


CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

// 更新圖像，若是iPhone就解除控制器
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image)
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = image;
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
	if (IS_IPHONE)
	{
        [self dismissViewControllerAnimated:YES completion:nil];
        imagePickerController = nil;
	}
}

-(void) snapImage:(id)sender{
    // 建立並初始化挑選器
	imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
	imagePickerController.delegate = self;
	
	if (IS_IPHONE)
	{
        [self presentViewController:imagePickerController animated:YES completion:nil];
	}
	else
	{
        if (popoverController) [popoverController dismissPopoverAnimated:NO];
        popoverController = [[UIPopoverController alloc] initWithContentViewController:imagePickerController];
        popoverController.delegate = self;
        [popoverController presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	}
}

// 解除挑選器
-(void) imgaePickerControllerDidCancel:(UIImagePickerController *) picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    imagePickerController = nil;
}

// 在iPad上，懸浮元件已經解除了
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)aPopoverController
{
	imagePickerController = nil;
    popoverController = nil;
}

- (void)image:(UIImage *)image didFinishSavingWithError: (NSError *)error contextInfo:(void *)contextInfo;
{
    // 處理寫入圖像程序結束時的情況
    if (!error)
        NSLog(@"Image written to photo album");
    else
        NSLog(@"Error writing to photo album: %@", [error localizedDescription]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(snapImage:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    PhotoDB = [[fmdbOP alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewDidAppear:(BOOL)animated
{
    imageView.frame = self.view.bounds;
    imageView.center = CGRectGetCenter(self.view.bounds);
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
@end
