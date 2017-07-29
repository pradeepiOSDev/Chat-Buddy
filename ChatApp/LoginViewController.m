//
//  LoginViewController.m
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/23/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "LoginViewController.h"
#import <Firebase.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




- (IBAction)loginButtonPressed:(id)sender {
    

    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if (email && password !=nil) {
        
        
        [[FIRAuth auth] signInWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable errorInSigningIn) {

            
            if (errorInSigningIn!=Nil) {
                
                NSLog(@"%@", errorInSigningIn);
                
            }
            
            else{
                
                [self dismissViewControllerAnimated:YES completion:nil];
                
                }
            
        }];
        
        
    }
    
}

- (IBAction)newUserButtonPressed:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
