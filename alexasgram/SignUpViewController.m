//
//  SignUpViewController.m
//  alexasgram
//
//  Created by alexamorales on 7/8/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

//the properties are specific to the the Sign up view controller
//remember on the storyboard to set this page equal to the sign in scree on class
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *email;


@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



//method for signing up user
- (void)registerUser {
   //  initialize a user object
   PFUser *newUser = [PFUser user];
    
   // set user properties
    newUser.username = self.username.text;
    newUser.email = self.email.text;
   newUser.password = self.password.text;
    
    // call sign up function on the object
   [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
           // manually segue to logged in view
        }
    }];
}

//the Cancel button is the action, you dismiss the animation and go back to login origional page
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//the create actount button is this action, then you call the registeruser methos through the action
- (IBAction)registerUser:(id)sender {
    [self registerUser];
}

@end
