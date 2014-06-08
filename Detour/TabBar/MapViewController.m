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
    UIViewController *toursView = [[ToursViewController alloc] initWithNibName:@"ToursViewController" bundle:nil];
    [self.navigationController pushViewController:toursView animated:YES];
}
- (IBAction)viewTourInfo:(id)sender {
    UIViewController *tourInfo= [[TourInfoViewController alloc] initWithNibName:@"TourInfoViewController" bundle:nil];
    [self.navigationController pushViewController:tourInfo animated:YES];
}

@end
