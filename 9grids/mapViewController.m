//
//  mapViewController.m
//  9grids
//
//  Created by 黃靖淳 on 13/8/27.
//  Copyright (c) 2013年 黃靖淳. All rights reserved.
//

#import "mapViewController.h"

@interface mapViewController ()
@end

@implementation mapViewController
@synthesize myMap;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Override point for customization after app launch
    myMap = [[MKMapView alloc]initWithFrame:self.view.bounds];
    //myMap.showsUserLocation = TRUE;
    myMap.mapType = MKMapTypeStandard;
    //myMap.delegate = self;
    CLLocationManager *loactionManager = [[CLLocationManager alloc]init];
    loactionManager.delegate = self;
    loactionManager.desiredAccuracy = kCLLocationAccuracyBest;
    loactionManager.distanceFilter = 1000.0f;
    [loactionManager startUpdatingLocation];
    
    MKCoordinateSpan theSpan;// set zoom level
    theSpan.latitudeDelta = 0.009;
    theSpan.longitudeDelta = 0.009;
    MKCoordinateRegion theRegion;
    theRegion.center = [[loactionManager location]coordinate];
    theRegion.span = theSpan;
    
    [myMap setRegion:theRegion];
    [myMap regionThatFits:theRegion];
    
    myMap.scrollEnabled = YES;
    myMap.zoomEnabled = YES;
    [self.view addSubview:myMap];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(snapImage:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    aPin = [[Pin alloc]init];
    aPin.latitude =25.0266;
    aPin.longitude = 121.4796;
    [myMap addAnnotation:aPin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
