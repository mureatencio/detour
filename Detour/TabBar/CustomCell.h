//
//  CustomCell.h
//  custom-uitableviewcell
//
//  Created by Matthew Schettler on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    
    IBOutlet UILabel *lblTitle;
    IBOutlet UITextView *lblDesc;
    IBOutlet UIImageView *imgBadge;
}
//- (void)loadBadge:(Movie *)mov;
@end
