//
//  TourViewController.m
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//

#import "ToursViewController.h"
#import "TourInfoViewController.h"
#import "MapViewController.H"

@interface ToursViewController ()

@end

@implementation ToursViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Tours List", @"Tours List");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        [self.tabBarController setTitle:@"Title"];
        self.navigationItem.hidesBackButton = YES;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame = CGRectMake(10, 6, 60, 30);
    UIButton *customButton = [[UIButton alloc] initWithFrame:frame];
    [customButton setTitle:@"Map" forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [customButton addTarget:self action:@selector(popToMapView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    UISwipeGestureRecognizer *swipeLeft1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeColor)];
    swipeLeft1.direction = UISwipeGestureRecognizerDirectionLeft;
    //Swipe methods
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
    [self sendRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [_groupTours count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    }
    else{
        Tour *tour = [[Tour alloc]init];
        tour = [_groupTours objectAtIndex:indexPath.row];
        
        
        UILabel *labelTitle = (UILabel *)[cell viewWithTag:1];
        labelTitle.text = tour.title;
        UILabel *labelPrice = (UILabel *)[cell viewWithTag:2];
        NSString *intString = [NSString stringWithFormat:@"%d", tour.price];
        NSString *strDolar = [@"$" stringByAppendingString:intString];
        NSString *totalPrice = [strDolar stringByAppendingString:@" per person"];
        labelPrice.text = totalPrice;
        
        UILabel *labelUbication = (UILabel *)[cell viewWithTag:3];
        labelUbication.text = tour.city;
        
        
        UIImageView *imageViewTour = (UIImageView*)[cell viewWithTag:100];
        
        NSURL *url = [NSURL URLWithString:[tour.image stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        [self downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                imageViewTour.image = image;
            }
        }];
    }
    
    
    return cell;
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
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
    [_tableView reloadData];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [_groupTours filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void) setDataNsarray{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier: @"showTourDetail" sender: self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTourDetail"]) {
//        TourDetailViewController *destViewController = segue.destinationViewController;
//        
        
        
        NSIndexPath *index = nil;
        
        if ([self.searchDisplayController isActive]) {
            //indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            //destViewController.recipeName = [searchResults objectAtIndex:indexPath.row];
            
        } else {
            Tour *tour = [[Tour alloc]init];
            tour = [_groupTours objectAtIndex:indexRow];
            
            TourInfoViewController *tourInfo= [[TourInfoViewController alloc] initWithNibName:@"TourInfoViewController" bundle:nil];
            tourInfo.tourDetail = tour;
            [self.navigationController pushViewController:tourInfo animated:YES];
            
//            
//            destViewController.tourDetail = tour;
        }
    }
}

- (IBAction)actionInfo:(id)sender {
    UIButton *btn = (UIButton *) sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:_tableView];
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:buttonFrameInTableView.origin];
    indexRow = indexPath.row;
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

- (IBAction)viewTourInfo:(id)sender {
    UIViewController *tourInfo= [[TourInfoViewController alloc] initWithNibName:@"TourInfoViewController" bundle:nil];
    [self.navigationController pushViewController:tourInfo animated:YES];
}

- (void) popToMapView {
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)dealloc {
    [super dealloc];
}
@end
