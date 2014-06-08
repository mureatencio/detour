//
//  MapViewController.m
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//

#import "MapViewController.h"
#import "ToursViewController.h"
#import "TourInfoViewController.h"
#import "Tour.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Tours Map", @"Tours Map");
        
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    [self sendRequest];
    CGRect frame = CGRectMake(10, 6, 60, 30);
    UIButton *customButton = [[UIButton alloc] initWithFrame:frame];
    [customButton setTitle:@"List" forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [customButton addTarget:self action:@selector(pushToursView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    [self.navigationItem setRightBarButtonItem:right];
    
    [self.navigationItem setRightBarButtonItem:right];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    swipeLeft.delegate = self;
    [swipeLeft release];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    swipeRight.delegate = self;
    [swipeRight release];
    // Do any additional setup after loading the view from its nib.
}

-(void) swipeRight:(UISwipeGestureRecognizer *) recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self.tabBarController setSelectedIndex:0];
    }
}

-(void) swipeLeft:(UISwipeGestureRecognizer *) recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self.tabBarController setSelectedIndex:2];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pushToursView {
//    
//    ToursViewController *viewController = [[UIStoryboard storyboardWithName:@"TourListView" bundle:nil] instantiateViewControllerWithIdentifier:@"ToursViewController"];
//    
//    UIViewController *toursView = [[ToursViewController alloc] initWithNibName:@"ToursViewController" bundle:nil];
//    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)viewTourInfo:(id)sender {
    UIViewController *tourInfo= [[TourInfoViewController alloc] initWithNibName:@"TourInfoViewController" bundle:nil];
    [self.navigationController pushViewController:tourInfo animated:YES];
}




#pragma  mark mapa


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKCustomAnnotation class]])
    {
        
        MKCustomAnnotation *myLocation = (MKCustomAnnotation *)annotation;
        MKAnnotationView *annotationView = [_mapView dequeueReusableAnnotationViewWithIdentifier:@"MKCustomAnnotation"];
        
        if (annotationView == nil) {
            annotationView = myLocation.annotationView;
        }
        else{
            annotationView.annotation = annotation;
            myLocation.tag = myLocation.tag;
        }
        annotationView.image = [UIImage imageNamed:@"pin.png"];

        //UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //[rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
        //annotationView.rightCalloutAccessoryView = rightButton;
        
        UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        infoButton.tag = myLocation.tag;
        [infoButton addTarget:self action:@selector(infoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = infoButton;
        
        
        UIImageView *myCustomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapa_dot.png"]];
        annotationView.leftCalloutAccessoryView = myCustomImage;
        
        
        
        return annotationView;
    }
    return nil;
    
}

-(IBAction) infoButtonPressed:(id) sender
{
    
    UIButton *clicked = (UIButton *) sender;
    int myTag = clicked.tag;
    NSLog(@"tag %d",myTag);
    
    tour = [[Tour alloc]init];
    tour = [_groupTours objectAtIndex:myTag];
    NSLog(@"Tour get %@",tour);
//    [self performSegueWithIdentifier:@"sendFromMarker" sender:sender];
    
    
    TourInfoViewController *tourInfo= [[TourInfoViewController alloc] initWithNibName:@"TourInfoViewController" bundle:nil];
    tourInfo.tourDetail = tour;
    [self.navigationController pushViewController:tourInfo animated:YES];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"sendFromMarker"])
    {
//        TourDetailViewController *destViewController = [segue destinationViewController];
//        destViewController.tourDetail = tour;
    }
}

#pragma mark api request
- (void)sendRequest {
    AFHTTPRequestOperationManager *curl;
    curl = [[AFHTTPRequestOperationManager alloc] init];
    
    
    curl.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [curl.requestSerializer setValue:@"B2oz7K2OQwuR7RFDE1PleqRBsfjWKfRzLogOgt3N" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [curl.requestSerializer setValue:@"eDW5bhV4lZsqOtk5nZGnINvgq342K2JGBT7jM28h" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [curl.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [curl GET:@"https://api.parse.com/1/classes/Experience" parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSDictionary *parseObject = responseObject;
          //NSLog(@"DATA %@",responseObject);
          [self getParseObject:parseObject];
      }
      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"Error: %@", error);
      }
     ];
    
    curl.securityPolicy.allowInvalidCertificates = YES;
}

-(void)getParseObject:(NSDictionary*)object{
    NSArray *results = [object valueForKey:@"results"];
    _groupTours = [[NSMutableArray alloc] init];
    
    for (NSDictionary *groupDic in results) {
        Tour *tour = [[Tour alloc]init];
        for (NSString *key in groupDic) {
            if ([key isEqualToString:@"activityType"]) {
                tour.activityType = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"address"]) {
                tour.address = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"city"]) {
                tour.city = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"country"]) {
                tour.country = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"description"]) {
                tour.description = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"images"]) {
                NSDictionary *getImages = [groupDic valueForKey:key];
                @try {
                    if(getImages.count > 0){
                        for (NSDictionary *getJsonImages in getImages) {
                            for (NSString *newkey in getJsonImages) {
                                if ([newkey isEqualToString:@"url"]) {
                                    tour.image = [getJsonImages valueForKey:newkey];
                                }
                            }}
                    }
                }
                @catch (NSException *exception) {
                    tour.image = @" ";
                }
            }
            if ([key isEqualToString:@"location"]) {
                NSDictionary *getLocation = [groupDic valueForKey:key];
                for (NSString *newkey in getLocation) {
                    if ([newkey isEqualToString:@"latitude"]) {
                        tour.latitude = [getLocation valueForKey:newkey];
                    }
                    if ([newkey isEqualToString:@"longitude"]) {
                        tour.longitude = [getLocation valueForKey:newkey];
                    }
                }
            }
            if ([key isEqualToString:@"objectId"]) {
                tour.objectId = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"price"]) {
                tour.price = [[groupDic valueForKey:key]intValue];
            }
            if ([key isEqualToString:@"requiredItems"]) {
                tour.requiredItems = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"title"]) {
                tour.title = [groupDic valueForKey:key];
            }
            if ([key isEqualToString:@"tripDuration"]) {
                tour.tripDuration = [groupDic valueForKey:key];
            }
        }
        [_groupTours addObject:tour];
    }
    NSLog(@"Tam tours %d",[_groupTours count]);
    [self addMarkers];
    NSLog(@"MARKET %@",marketLocations);
    
}

-(void) addMarkers{
    
    marketLocations = [[NSMutableArray alloc]init];
    
    for (int x = 0; x < [_groupTours count]; x++)
    {
        Tour *tour = [[Tour alloc]init];
        tour = [_groupTours objectAtIndex:x];
        float latitude = [tour.latitude floatValue];
        float longitude = [tour.longitude floatValue];
        
        CLLocationCoordinate2D point1 = CLLocationCoordinate2DMake(latitude, longitude);
        NSString *tag = [NSString stringWithFormat:@"%d", x];
        MKCustomAnnotation *Annotation = [[MKCustomAnnotation alloc]initWithTitle:tour.title Subtitle:tour.tripDuration Location:point1];
        Annotation.tag = x;
        [_mapView addAnnotation:Annotation];
    }
    NSLog(@"maket %@",marketLocations);
    [_mapView addAnnotations:marketLocations];
    NSLog(@"maket %@",marketLocations);
    
    
}






@end
