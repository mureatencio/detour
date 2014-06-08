//
//  MKCustomAnnotation.m
//  ParseExample
//
//  Created by UNA on 08/06/14.
//  Copyright (c) 2014 GoTouch. All rights reserved.
//

#import "MKCustomAnnotation.h"

@implementation MKCustomAnnotation


-(id)initWithTitle:(NSString *)newTitle Subtitle:(NSString*)subtitle Location:(CLLocationCoordinate2D)location{
    self = [super init];
    if (self) {
        _title = newTitle;
        _coordinate = location;
        _subtitle = subtitle;
    }
    return self;
}
- (MKAnnotationView *)annotationView{
    
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MKCustomAnnotation"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"pin.png"];
    //UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //[rightButton addTarget:nil action:@selector(setTitle:) forControlEvents:UIControlEventTouchUpInside];
    //[rightButton setFrame:CGRectMake(0,0,62,62)];
   // annotationView.rightCalloutAccessoryView = rightButton;
    
    return annotationView;
}


@end
