//
//  MapViewController.h
//  MapView
//
//  Created by pcs20 on 9/11/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>


@property(nonatomic,strong)IBOutlet MKMapView *mapView;
@property(nonatomic,strong)IBOutlet CLLocationManager *CLManager;
@property(nonatomic,strong)CLGeocoder *geocode;


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

@end
