//
//  mapViewController.h
//  9grids
//
//  Created by 黃靖淳 on 13/8/27.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Pin.h"
#import "SnapController.h"
@interface mapViewController : SnapController<CLLocationManagerDelegate>{
    MKMapView *myMap;
    Pin *aPin;
}
@property (strong, retain) IBOutlet MKMapView *myMap;

@end
