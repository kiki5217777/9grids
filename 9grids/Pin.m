//
//  Pin.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/28.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "Pin.h"

@implementation Pin
@synthesize latitude;
@synthesize longitude;

-(CLLocationCoordinate2D) coordinate{
    CLLocationCoordinate2D coord = {self.latitude, self.longitude};
    return coord;
}
@end
