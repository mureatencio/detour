//
//  MKCustomAnnotation.h
//  ParseExample
//
//  Created by UNA on 08/06/14.
//  Copyright (c) 2014 GoTouch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MKCustomAnnotation : NSObject<MKAnnotation>{
    NSString *subtitle;
    NSString *title;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property int tag;

-(id)initWithTitle:(NSString *)newTitle Subtitle:(NSString*)subtitle Location:(CLLocationCoordinate2D)location;
- (MKAnnotationView *)annotationView;
- (int)getIndexTour;
@end
