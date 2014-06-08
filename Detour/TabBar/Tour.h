//
//  Tour.h
//  ParseExample
//
//  Created by UNA on 07/06/14.
//  Copyright (c) 2014 GoTouch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tour : NSObject

@property(strong,nonatomic) NSString *city;
@property(strong,nonatomic) NSString *country;
@property(strong,nonatomic) NSString *activityType;
@property(strong,nonatomic) NSString *requiredItems;
@property(nonatomic) int *price;
@property(strong,nonatomic) NSString *description;
@property(strong,nonatomic) NSString *image;
@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *tripDuration;
@property(strong,nonatomic) NSString *latitude;
@property(strong,nonatomic) NSString *longitude;
@property(strong,nonatomic) NSString *objectId;
@property(strong,nonatomic) NSString *address;
@end
