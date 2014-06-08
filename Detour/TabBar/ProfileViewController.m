//
//  ProfileViewController.m
//  BCExperience
//
//  Created by Kai´s mac on 6/7/14.
//  Copyright (c) 2014 Appslab CR. All rights reserved.
//

#import "ProfileViewController.h"
#import "SubmitViewController.h"
#import "AchievedCellTableViewCell.h"

@interface ProfileViewController ()
@property (retain, nonatomic) IBOutlet UITableView *achievedTableView;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollChallenge;
@property (retain, nonatomic) IBOutlet UILabel *pendingLabel;
@property (retain, nonatomic) IBOutlet UILabel *achievedLabel;

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Profile", @"Profile");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)settingSwipe
{
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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.achievedTableView.delegate = self;
    [self.achievedTableView registerNib:[UINib nibWithNibName:@"AchievedCellTableViewCelL" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"achievedCell"];

    
    [self settingSwipe];
    NSString *prefix = @"challenge%i.png";
    for (int i = 0; i < 4; i++) {
        UIImageView *challenge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:prefix, i+1]]];
        challenge.frame = CGRectMake(i*103+18, 0, 93, 93);
        [self.scrollChallenge addSubview:challenge];
//        UITapGestureRecognizer *tap = UITap
    }
    self.scrollChallenge.contentSize = CGSizeMake(4*103+18, self.scrollChallenge.bounds.size.height);
    
    //Custom fonts
    self.pendingLabel.font = [UIFont fontWithName:@"BebasNeue" size:20];
    self.achievedLabel.font = self.pendingLabel.font;
}

-(void) swipeRight:(UISwipeGestureRecognizer *) recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
//        [self.tabBarController setSelectedIndex:0];
    }
}

-(void) swipeLeft:(UISwipeGestureRecognizer *) recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self.tabBarController setSelectedIndex:1];
    }
}

- (void) swipeScrollView {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SubmitExperience:(id)sender {
    UIViewController *challengeView= [[SubmitViewController alloc] initWithNibName:@"SubmitViewController" bundle:nil];
    [self.navigationController pushViewController:challengeView animated:YES];
}

- (void)dealloc {
    [_achievedTableView release];
    [_scrollChallenge release];
    [_pendingLabel release];
    [_achievedLabel release];
    [super dealloc];
}

#pragma mark table view methods

#pragma mark table view delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:MyIdentifier];
    }
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    UIFont *title = [ UIFont fontWithName: @"Dinpro" size: 16.0 ];
    UIFont *detail = [ UIFont fontWithName: @"Dinpro" size: 12.0 ];
    cell.textLabel.font  = title;
    cell.detailTextLabel.font  = detail;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:(155/255.0) green:(154/255.0) blue:(154/255.0) alpha:1];
    cell.backgroundColor = [UIColor clearColor];
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:(45/255.0) green:(45/255.0) blue:(45/255.0) alpha:1];
    cell.selectedBackgroundView = selectionColor;
    tableView.backgroundColor = [UIColor clearColor];
    switch (indexPath.row) {
        case 0:
            [cell.imageView setImage:[UIImage imageNamed:@"tour1.png"]];
            cell.textLabel.text = @"Whitewater Kayaking School";
            cell.detailTextLabel.text = @"with Andy Thunell near Green River, UT";
            break;
        case 1:
            [cell.imageView setImage:[UIImage imageNamed:@"tour2.png"]];
            cell.textLabel.text = @"Rafting";
            cell.detailTextLabel.text = @"with Will Sands near Boulder, CO";
            
            break;
        case 2:
            [cell.imageView setImage:[UIImage imageNamed:@"tour3.png"]];
            cell.textLabel.text = @"Cycling";
            cell.detailTextLabel.text = @"with Andy Hansen near Boulder, CO";
            break;
        case 3:
            [cell.imageView setImage:[UIImage imageNamed:@"tour4.png"]];
            cell.textLabel.text = @"Hiking";
            cell.detailTextLabel.text = @"with Dave Harris near Boulder, CO";
            break;
            
        default:
            break;
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

//eliminar celdas sobrantes
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    
    return view;
}
@end
