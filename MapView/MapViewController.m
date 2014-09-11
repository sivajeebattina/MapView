//
//  MapViewController.m
//  MapView
//
//  Created by pcs20 on 9/11/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

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
    _mapView.mapType=MKMapTypeSatellite;
    [self.view addSubview:_mapView];
    
    _mapView.delegate=self;
    
    
    
    _CLManager=[[CLLocationManager alloc] init];
    _CLManager.delegate=self;
    [_CLManager startUpdatingLocation];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{

    if([manager locationServicesEnabled]){
        float longitude=newLocation.coordinate.longitude;
        float lattitude=newLocation.coordinate.latitude;
        NSLog(@"Longitude: %f",longitude);
        NSLog(@"Lattitude: %f",lattitude);
        
        
        _geocode=[[CLGeocoder alloc] init];
        [_geocode reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:lattitude longitude:longitude] completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"%@",placemarks);
            
        }];
        [manager stopUpdatingLocation];
        
        _mapView.showsUserLocation=TRUE;
        _mapView.userLocation.title= NSLocalizedString (@"Here Iam",@"Here Iam" );
        [self performSelector:@selector(openCallout:) withObject:_mapView.userLocation afterDelay:0.2];
        
        
       
    
    }
    
        else{
        NSLog(@"This service is not available");
            
        }
    


}


- (void)openCallout:(id<MKAnnotation>)annotation {
    [_mapView selectAnnotation:annotation animated:YES];}
@end
