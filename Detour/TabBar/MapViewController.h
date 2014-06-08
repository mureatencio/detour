//
//  MapViewController.h
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MKCustomAnnotation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFURLConnectionOperation.h"
#import "AFHTTPRequestOperation.h"
#import "Tour.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, UIGestureRecognizerDelegate>
{
    NSMutableArray *marketLocations;
    NSArray *hotels;
    
    MKMapView *mapView;
	MKAnnotationView *selectedAnnotationView;
	UIViewController *calloutDetailController;
    Tour *tour;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) NSMutableArray *marketLocations;
@property (strong,nonatomic) NSMutableArray *groupTours;
@property (nonatomic, retain) MKAnnotationView *selectedAnnotationView;
@property (nonatomic, retain) UIViewController *calloutDetailController;

@end