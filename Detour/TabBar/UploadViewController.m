//
//  UploadViewController.m
//  Progra3
//
//  Created by UNA on 08/06/14.
//  Copyright (c) 2014 GoTouch. All rights reserved.
//

#import "UploadViewController.h"

@interface UploadViewController ()

@end

@implementation UploadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_imageView.layer setShadowOffset:CGSizeMake(-1.0, -1.0)];
    [_imageView.layer setShadowOpacity:0.5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)cameraButtonTapped:(id)sender{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera] == YES){
        // Create image picker controller
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        
        NSLog(@"Image picker %@",imagePicker);
        
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (IBAction)choosePhoto:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
	[self presentModalViewController:picker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // Dismiss controller
    //[picker dismissModalViewControllerAnimated:YES];
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Upload image
    imageData = UIImageJPEGRepresentation(image, 0.05f);
    
    UIImage *imaAux = [[UIImage alloc]initWithData:imageData];
    [_imageView setImage:imaAux];
    
    
}
- (IBAction)pop:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!!"
                                                    message:@"You have completed this challenge. Now challenge your friends."
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    
}




- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 0) {
        // here...
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
