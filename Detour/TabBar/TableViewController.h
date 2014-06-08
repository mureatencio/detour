//
//  TableViewController.h
//  custom-uitableviewcell
//
//  Created by Matthew Schettler on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Movie.h"
#import "CustomCell.h"


@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    IBOutlet UITableView *tableView;
    
    NSArray *datasource;

}

@end
