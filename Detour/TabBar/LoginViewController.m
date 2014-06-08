//
//  LoginViewController.m
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController {
    UIScrollView *fondo;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    fondo = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    fondo.userInteractionEnabled = NO;
    fondo.contentSize = CGSizeMake(393, 568);
    fondo.backgroundColor = [UIColor blackColor];
    
    UIView *bgImage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 393, 568)];
    bgImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cabro"]];
    [fondo addSubview:bgImage];
    [self.view addSubview:fondo];
    
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    logo.center = CGPointMake(320/2, 150);
    [self.view addSubview:logo];
    
    UIImageView *liveLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live"]];
    liveLabel.center = CGPointMake(500, 127);
    [self.view addSubview:liveLabel];
    
    UIImageView *signUp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"signup"]];
    signUp.center = CGPointMake(81, 700);
    UIImageView *login = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login"]];
    login.center = CGPointMake(237, 700);
    UITapGestureRecognizer *newTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(login)];
    [login setUserInteractionEnabled:YES];
    [login addGestureRecognizer:newTap];
    [self.view addSubview:signUp];
    [self.view addSubview:login];
    
    [UIView animateWithDuration: 2 delay:2 options:nil animations:^{
        logo.center = CGPointMake(-200, 150);
        [fondo setContentOffset:CGPointMake(56, 0) animated:YES];
        liveLabel.center = CGPointMake(95, liveLabel.center.y);
        login.center = CGPointMake(login.center.x, 530);
        signUp.center = CGPointMake(signUp.center.x, 530);
    } completion:^(BOOL finished) {
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)login {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate.window setRootViewController:appDelegate.tabBarController];
}

@end
