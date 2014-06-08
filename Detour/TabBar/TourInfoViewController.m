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
    NSLog(@"Tour detail %@",_tourDetail.title);
    self.title = _tourDetail.title;
    [self loadDataDetail];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadDataDetail{
    NSLog(@"loading tour %@",_tourDetail.title);
    _labelTitle.text = _tourDetail.title;
    NSString *intString = [NSString stringWithFormat:@"%d", tourDetail.price];
    _labelPrice.text = intString;
    _labelPrice.text = _tourDetail.tripDuration;
    _labelDuration.text = _tourDetail.tripDuration;
    _labelPlace.text = _tourDetail.city;
    _labelDescription.text = _tourDetail.description;
    
    
    NSURL *url = [NSURL URLWithString:[_tourDetail.image stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *imageLoad;
    imageLoad = [[UIImage alloc] initWithData:imageData];
    _imageMain.image = imageLoad;
    
    NSArray *req = [_tourDetail valueForKey:@"requiredItems"];
    NSMutableArray *arrayProducts = [[NSMutableArray alloc]init];
    //NSLog(@"req %@", req);
    for (int count = 0; count < req.count; count++) {
        // NSLog(@"Item: %@", [req objectAtIndex:count]);
        [arrayProducts addObject:[req objectAtIndex:count]];
    }
    query = [[NSArray alloc] initWithArray:arrayProducts];
    [self fill];
    NSLog(@"Listado final: %@", products);
}

- (void) fill{
    NSLog(@"Filling");
    NSLog(@"Query %@",query);
    NSLog(@"query count %d",query.count);
    products = [[NSMutableArray alloc]init];
    NSString *consulta = @"http://productapipqa-vip.bcinfra.net:9000/v1/products";
    for (NSString *item in query) {
        NSLog(@"Item %@",item);
        [curl GET:consulta parameters:@{ @"q": item, @"site": @"bcs", @"limit": @1 }
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"producto: %@, item: %@", responseObject[@"products"][0], item);
              if(responseObject[@"products"][0] != nil){
                  [products addObject:responseObject[@"products"][0]];
                  //[listado reloadData];
                  NSLog(@"Listado final: %@", products);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error = %@", error);
          }];
    }
    NSLog(@"Listado final: %@", products);
}

- (IBAction)buttonFacebook:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [mySLComposerSheet setInitialText:@"#ExploreBackcountry"];
        
        [mySLComposerSheet addImage:[UIImage imageNamed:@"fondo_inicio.png"]];
        
        [mySLComposerSheet addURL:[NSURL URLWithString:@"https://detour.backcountry.com/"]];
        
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Post Canceled");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Post Sucessful");
                    [self showMessagePost];
                    break;
                    
                default:
                    break;
            }
        }];
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
}


- (IBAction)buttonTwitter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [mySLComposerSheet setInitialText:@"#ExploreBackcountry"];
        
        [mySLComposerSheet addImage:[UIImage imageNamed:@"fondo_inicio.png"]];
        
        [mySLComposerSheet addURL:[NSURL URLWithString:@"https://detour.backcountry.com/"]];
        
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Post Canceled");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Post Sucessful");
                    [self showMessagePost];
                    break;
                    
                default:
                    break;
            }
        }];
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    
}

-(void) showMessagePost{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hello World!"
                                                      message:@"This is your first UIAlertview message."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 40, 40)];
    
    [message show];
    
    
}

- (void)sharingStatus {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        NSLog(@"service available");
        self.facebook.enabled = YES;
        self.facebook.alpha = 1.0f;
    } else {
        self.facebook.enabled = NO;
        self.facebook.alpha = 0.5f;
    }
}

- (void)sharingStatusT {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"service available");
        self.twitter.enabled = YES;
        self.twitter.alpha = 1.0f;
    } else {
        self.twitter.enabled = NO;
        self.twitter.alpha = 0.5f;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sharingStatus) name:ACAccountStoreDidChangeNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:ACAccountStoreDidChangeNotification];
}

- (IBAction)pushChallengeView:(id)sender {
    UIViewController *challengeView= [[ChallengeViewController alloc] initWithNibName:@"ChallengeViewController" bundle:nil];
    [self.navigationController pushViewController:challengeView animated:YES];
}

- (IBAction)challengeFriends:(id)sender {
}
@end
