//
//  Pin.h
//  9grids
//
//  Created by 黃靖淳 on 13/8/28.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Pin : NSObject<MKAnnotation>{
    float latitude;
    float longitude;
}
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@end
