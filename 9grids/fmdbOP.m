//
//  fmdbOP.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/29.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "fmdbOP.h"

@implementation fmdbOP
-(id)init{
    if (self = [super init]) {
        if (fileMgr == nil) {
            fileMgr = [NSFileManager defaultManager];
            [self createDataBaseAndTablesIfNeeded];
            //[self insertDataToDB];
            //[self getDataFromDB];
        }
    }
    return self;
}

-(void) createDataBaseAndTablesIfNeeded{
    fileMgr = [NSFileManager defaultManager];
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDataBase.db"];
    //如果已經建立過就跳過
    if([fileMgr fileExistsAtPath:dbPath]) return;
    //打開通道
    db = [FMDatabase databaseWithPath:dbPath] ;
    [db open];
    
    if (![db open]) {
        NSLog(@"Could not open db!");
        return ;
    }
    else{
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS PersonList (Name, Age, Sex, Phone, Address, Photo)"];
        
        [db executeUpdate:@"INSERT INTO PersonList (Name, Age, Sex, Phone, Address, Photo) VALUES (?,?,?,?,?,?)",@"Jone",[NSNumber numberWithInt:20],[NSNumber numberWithInt:0],@"09123456", @"Taiwan",@"filepath"];
        
        FMResultSet *rs = [db executeQuery:@"SELECT Name, Age, Sex, Phone, Address, Photo, FROM PersonList"];
        while ([rs next]) {
            NSString *name = [rs stringForColumn:@"Name"];
            int age = [rs intForColumn:@"Age"];
            int sex = [rs intForColumn:@"Sex"];
            NSString *phone = [rs stringForColumn:@"Phone"];
            NSString *assress = [rs stringForColumn:@"Address"];
            NSString *photo = [rs stringForColumn:@"Photo"];
            
            NSLog(@"Name%@, Age%i, Sex%i, Phone%@, Address%@, Photo%@", name,age,sex,phone,assress,photo);
        }

    }
    
    //資料傳完了，通道要關好
    [db close];
}
/*
-(void) insertDataToDB{
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDataBase.db"];
    
    db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    //開啟與資料庫的通道
    if (![db open]) {
        NSLog(@"Could not open db.");
    }else {
        [db executeUpdate:@"NSERT INTO PersonList (Name, Age, Sex, Phone, Address, Photo) VALUES (?,?,?,?,?,?)",@"Jone",[NSNumber numberWithInt:20],[NSNumber numberWithInt:0],@"09123456", @"Taiwan",@"filepath"];
    }
    //資料傳完了，通道要關好
    [db close];
}
-(void) getDataFromDB{
    
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDataBase.db"];
    
    db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    if (![db open]) {
        NSLog(@"Could not open db.");
    }else {
        FMResultSet *rs = [db executeQuery:@"SELECT Name, Age, Sex, Phone, Address, Photo, FROM PersonList"];
        while ([rs next]) {
            NSString *name = [rs stringForColumn:@"Name"];
            int age = [rs intForColumn:@"Age"];
            int sex = [rs intForColumn:@"Sex"];
            NSString *phone = [rs stringForColumn:@"Phone"];
            NSString *assress = [rs stringForColumn:@"Address"];
            NSString *photo = [rs stringForColumn:@"Photo"];
            
            NSLog(@"Name%@, Age%i, Sex%i, Phone%@, Address%@, Photo%@", name,age,sex,phone,assress,photo);
        }
    }
    //資料傳完了，通道要關好
    [db close];
    
   
}*/
@end
