//
//  AnnoteFile.h
//  MapView
//
//  Created by pcs20 on 9/11/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapViewController.h"

@interface AnnoteFile : NSObject<MKAnnotation>

@property(nonatomic,strong)CLLocation *coordinate;

@end
