//
//  Detour.h
//  ParseExample
//
//  Created by UNA on 07/06/14.
//  Copyright (c) 2014 GoTouch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListTours : NSObject

@property (strong,nonatomic) NSMutableArray *deTours;
- (id)initWithData:(NSMutableArray*)tours;
+(ListTours*)theTours;


@end
