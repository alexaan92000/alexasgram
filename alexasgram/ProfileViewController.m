//
//  ProfileViewController.m
//  alexasgram
//
//  Created by alexamorales on 7/9/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "PostingViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *setImage;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//method to log out
- (void)logoutUser{
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        [self dismissViewControllerAnimated:YES completion:nil];
    }];}

//press logout button, this action calls the method that eraes the user then dismisses
- (IBAction)logout:(id)sender {
    [self logoutUser];
}


//Working on cliquing button and being able to pull up photos and set as profile pic
- (IBAction)AddProfilePhoto:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    //edited image is the resizing of the image
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    [self.setImage setImage:editedImage];
    
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
