//
//  LoginViewController.m
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/23/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




- (IBAction)loginButtonPressed:(id)sender {
}

- (IBAction)newUserButtonPressed:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
    
}
@end
