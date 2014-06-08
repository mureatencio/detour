//
//  TourViewController.h
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "AFURLConnectionOperation.h"
#import "AFHTTPRequestOperation.h"


@interface ToursViewController : UIViewController <UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *searchResults;
    NSArray *tours;
    int indexRow;
}

- (IBAction)actionInfo:(id)sender;

@property (strong,nonatomic) NSMutableArray *groupTours;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UITableViewCell *tableViewCell;


@end
