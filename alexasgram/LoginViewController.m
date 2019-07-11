//
//  LoginViewController.m
//  alexasgram
//
//  Created by alexamorales on 7/9/19.
//  Copyright © 2019 alexamorales. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

//remember that properties are specific to the view controller I created
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *alexasgram;
@property (strong, nonatomic) IBOutlet UIView *background;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    // Do any additional setup after loading the view.
}

//method to login User
- (void)loginUser {
    NSString *username = self.loginTextField.text;//@"a";
    NSString *password = self.passwordTextField.text;//@"a";
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
            [self performSegueWithIdentifier:@"showTabBar" sender:nil];
        }
    }];
}

//the log in BUTTON is how and why I created the action, every button is an action. this action for login in is calling the loginUser method
- (IBAction)loginin:(id)sender {
    [self loginUser];
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
