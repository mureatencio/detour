//
//  Detour.m
//  ParseExample
//
//  Created by UNA on 07/06/14.
//  Copyright (c) 2014 GoTouch. All rights reserved.
//

#import "ListTours.h"

@implementation ListTours

- (id)initWithData:(NSMutableArray *)tours{
    if(self = [super init]){
        self.deTours = tours;
    }
    return self;
}

+(ListTours*)theTours{
    static ListTours *theTours = nil;
    if (!theTours) {
        theTours = [[super allocWithZone:nil]init];
    }
    return theTours;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self theTours];
}

@end
