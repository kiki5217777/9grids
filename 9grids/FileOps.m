//
//  FileOps.m
//  TextView
//
//  Created by 范 丙林 on 12/7/15.
//  Copyright (c) 2012年 國立台北教育大學. All rights reserved.
//

#import "FileOps.h"
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@implementation FileOps
@synthesize fileMgr;
@synthesize homeDir;
@synthesize filename;
@synthesize filepath,fileOpened;
@synthesize stringImage,stringImageName,imagefilepath,imagefiletype;

-(NSString *) setFilename{
    filename = @"myorderfile.txt";
    return filename;
}
/* get a handle on the directory where to write and read our file
   if doesn't exist, it will be created. */

-(NSString *)GetDocumentDirectory{
    fileMgr = [NSFileManager defaultManager];
    homeDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return homeDir;
}
-(void)WriteToStringFile:(NSMutableString *)textToWrite{
    filepath = [[NSString alloc] init];
    NSError *err;
    filepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFilename];
    NSLog(@"%@",filepath);
    //filepath = [self.GetDocumentDirectory stringByAppendingPathComponent:@"tt.txt"];
    BOOL ok = [textToWrite writeToFile:filepath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    if(!ok){
        NSLog(@"Error writing file at %@\n%@",filepath, [err localizedFailureReason]);
    }
}
-(NSString *)readFromFile{
    filepath = [[NSString alloc]init];
    NSError *error;
    NSString *title;
    filepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFilename];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filepath encoding:NSUnicodeStringEncoding error:&error];
    if(!txtInFile){
        UIAlertView *tellErr = [[UIAlertView alloc] initWithTitle:title message:@"Unable to get text from file" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [tellErr show];
    }
    return txtInFile;
}
//set image name
-(NSString *) setImageFilename{
    stringImageName = @"myorderimagefile";
    imagefiletype = @".png";
    //return [stringImageName stringByAppendingFormat:@"%@%@",stringImageName, imagefiletype];
    return [stringImageName stringByAppendingFormat:@"%@",imagefiletype];
}

//string save into image
-(void)stringToimage:(NSMutableString *)textToImage{
    CGRect rect = CGRectMake(0, 0,200,200);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    [RGBA(100, 100, 100, 1) set];
    [textToImage drawInRect:rect withFont:[UIFont fontWithName:@"STHeitiTC-Medium" size:12.0f]];
    stringImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}

//save image
-(void) WriteToImageFile{
    imagefilepath = [[NSString alloc]init];
    //NSError *err;
    imagefilepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setImageFilename];
    NSLog(@"%@",imagefilepath);
    //BOOL ok =[UIImagePNGRepresentation(stringImage) writeToFile:imagefilepath error:&err];
    /*if (!ok) {
     NSLog(@"Error writing file at %@\n%@",imagefilepath,[err localizedFailureReason]);
     }*/
    [UIImagePNGRepresentation(stringImage) writeToFile:imagefilepath atomically:YES];
    
}
//load image
-(UIImage *) ReadFromImageFileWithName{
    //fileOpened = name;
    imagefilepath = [[NSString alloc]init];
    //NSError *err;
    NSString *title;
    imagefilepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setImageFilename];
    //NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:imagefilepath encoding:NSUnicodeStringEncoding error:&err];
    UIImage *image =[UIImage imageWithContentsOfFile:imagefilepath];
    if(!image){
        UIAlertView *tellErr = [[UIAlertView alloc] initWithTitle:title message:@"Unable to get image from file" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [tellErr show];
    }
return image;

}
@end
