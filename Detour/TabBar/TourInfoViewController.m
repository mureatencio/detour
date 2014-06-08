//
//  TourInfoViewController.m
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//

#import "TourInfoViewController.h"
#import "ChallengeViewController.h"

@interface TourInfoViewController ()

@end

@implementation TourInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Tour Name", @"Tour Name");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushChallengeView:(id)sender {
    UIViewController *challengeView= [[ChallengeViewController alloc] initWithNibName:@"ChallengeViewController" bundle:nil];
    [self.navigationController pushViewController:challengeView animated:YES];
}

@end
