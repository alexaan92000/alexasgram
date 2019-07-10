//
//  ProfileViewController.m
//  alexasgram
//
//  Created by alexamorales on 7/9/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
