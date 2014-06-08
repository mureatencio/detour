//
//  TourInfoViewController.h
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Tour.h"
#import "AFNetworking.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface TourInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    Tour *tourDetail;
    NSArray *query;
    AFHTTPRequestOperationManager *curl;
}

//@property (strong) Tour *tourDetail;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelPlace;
@property (strong, nonatomic) IBOutlet UILabel *labelDuration;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UIImageView *imageMain;
@property (strong, nonatomic) IBOutlet UILabel *labelDescription;

- (IBAction)buttonFacebook:(id)sender;
- (IBAction)buttonTwitter:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *facebook;
@property (strong, nonatomic) IBOutlet UIButton *twitter;
@property (nonatomic, readwrite, assign) Tour *tourDetail;

@end
