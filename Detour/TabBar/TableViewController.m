//
//  TableViewController.m
//  custom-uitableviewcell
//
//  Created by Matthew Schettler on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    Movie *m1 = [Movie new];
//    m1.YEAR = 2012;
//    m1.IMDB_RATING = 9.3;
//    m1.TITLE = @"The Best Movie In The World";
//    m1.IMDB_URL = @"www.google.com";
//    m1.POSTER_NAME = @"noposter";
//    m1.PLOT = @"Action";
//    
//    Movie *m2 = [Movie new];
//    m2.YEAR = 1995;
//    m2.IMDB_RATING = 2.3;
//    m2.TITLE = @"The Worst Movie In The World";
//    m2.IMDB_URL = @"www.google.com";
//    m2.POSTER_NAME = @"noposter";
//    m2.PLOT = @"Drama";
//    
//    Movie *m3 = [Movie new];
//    m3.YEAR = 2012;
//    m3.IMDB_RATING = 9.3;
//    m3.TITLE = @"The Best Msaasovie In The World";
//    m3.IMDB_URL = @"www.google.com";
//    m3.POSTER_NAME = @"noposter";
//    m3.PLOT = @"Actdssdion";
//    
//    Movie *m4 = [Movie new];
//    m4.YEAR = 1995;
//    m4.IMDB_RATING = 2.3;
//    m4.TITLE = @"The Worst Movie In The World";
//    m4.IMDB_URL = @"www.google.com";
//    m4.POSTER_NAME = @"noposter";
//    m4.PLOT = @"Drasddsma";
//
//    
//    datasource = [[NSArray alloc] initWithObjects:m1, m2,m3, m4, nil];
//    
//}
//
//- (int)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    assert(datasource);
//    return datasource.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    // this is the "black magic" that easily enables us to use custom cell w/ IB
//    UITableViewCell *cell = nil;
//
//    CustomCell *temp = [[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
//    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:temp options:nil];
//    id firstObject = [topLevelObjects objectAtIndex:0];
//    if ([firstObject isKindOfClass:[UITableViewCell class]]) {
//        cell = firstObject;
//    } else {
//        cell = [topLevelObjects objectAtIndex:1];
//    }
//
//    
//    // get associated movie object
//    Movie *m = [datasource objectAtIndex:indexPath.row];
//    
//    // make the cell display the contents of this movie
//    [temp loadBadge:m]; 
//
//
//    
//    
//    return cell;
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 214;
}

@end
