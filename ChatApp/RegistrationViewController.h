//
//  RegistrationViewController.h
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/23/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)registerButtonPressed:(id)sender;

- (IBAction)existingUserButtonPressed:(id)sender;

@end
