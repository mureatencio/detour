//
//  UploadViewController.h
//  Progra3
//
//  Created by UNA on 08/06/14.
//  Copyright (c) 2014 GoTouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadViewController : UIViewController{
    IBOutlet UIScrollView *photoScrollView;
    NSMutableArray *allImages;
    NSData *imageData;
}

- (IBAction)cameraButtonTapped:(id)sender;
- (void)setUpImages:(NSArray *)images;
//- (void)buttonTouched:(id)sender;
- (IBAction)choosePhoto:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end
