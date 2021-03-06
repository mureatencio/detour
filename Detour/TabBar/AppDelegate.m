
#import "AppDelegate.h"

#import "ProfileViewController.h"

#import "ToursViewController.h"

#import "LoginViewController.h"

#import "MapViewController.h"

#import "BadgesViewController.h"


@implementation AppDelegate
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    UIColor *navColor = [UIColor colorWithRed:0.0 green:104/255.0 blue:165/255.0 alpha:1];
    NSDictionary *navStyle = @{
                              NSForegroundColorAttributeName: [UIColor whiteColor],
                              NSFontAttributeName: [UIFont fontWithName:@"BebasNeue" size:33.0f]
    };
    UIViewController *profileViewController = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    UINavigationController *profileNavControler = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    [profileNavControler.navigationBar setBarTintColor: navColor];
    profileNavControler.navigationBar.titleTextAttributes =  navStyle;
    
    UIViewController *mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    UINavigationController *toursNavController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    [toursNavController.navigationBar setBarTintColor: navColor];
    toursNavController.navigationBar.titleTextAttributes =  navStyle;
    
    UIViewController *badgesViewController = [[BadgesViewController alloc] initWithNibName:@"BadgesViewController" bundle:nil];
    UINavigationController *badgesNavController = [[UINavigationController alloc] initWithRootViewController:badgesViewController];
    [badgesNavController.navigationBar setBarTintColor: navColor];
    badgesNavController.navigationBar.titleTextAttributes =  navStyle;
    
    UIViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:profileNavControler, toursNavController, badgesNavController, nil];
    //    self.window.rootViewController = self.tabBarController;
        self.window.rootViewController = loginViewController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
