//
//  fmdbOP.h
//  9grids
//
//  Created by 黃靖淳 on 13/8/29.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMResultSet.h"
#import "FMDatabasePool.h"
#import "FMDatabaseQueue.h"
@interface fmdbOP : NSObject{
    NSArray *paths;
    NSFileManager *fileMgr;
    FMDatabase *db;
}
-(void) createDataBaseAndTablesIfNeeded;
@end
