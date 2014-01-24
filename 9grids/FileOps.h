//
//  FileOps.h
//  TextView
//
//  Created by 范 丙林 on 12/7/15.
//  Copyright (c) 2012年 國立台北教育大學. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileOps : NSObject{
    NSFileManager *fileMgr;
    NSString *homeDir;
    NSString *filename;
    NSString *filepath;
    NSString *fileOpened;
    UIImage  *stringImage;
    NSString *stringImageName;
    NSString *imagefilepath;
    NSString *imagefiletype;
}

@property(nonatomic,retain) NSFileManager *fileMgr;
@property(nonatomic,retain) NSString *homeDir;
@property(nonatomic,retain)  NSString *filename;
@property(nonatomic,retain)  NSString *filepath,*fileOpened;
@property(nonatomic,retain)  UIImage  *stringImage;// stringimage
@property(nonatomic,retain)  NSString *stringImageName,*imagefilepath,*imagefiletype;//stringimage name,path

-(NSString *) GetDocumentDirectory;
-(void)WriteToStringFile:(NSMutableString *)textToWrite;
-(NSString *) readFromFile;
-(NSString *) setFilename;

-(NSString *) setImageFilename; //set image name
-(void) stringToimage:(NSMutableString*) textToImage;//string saved to image
-(void) WriteToImageFile; //save image
-(UIImage *) ReadFromImageFileWithName; //load image
@end
