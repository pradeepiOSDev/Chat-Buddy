//
//  RegistrationViewController.m
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/23/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "RegistrationViewController.h"
#import <Firebase.h>


@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *imageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    
    [self.imageView setUserInteractionEnabled:YES];
    [self.imageView addGestureRecognizer:imageTap];

}


- (IBAction)registerButtonPressed:(id)sender {
    
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    
    
    if (name && email && password != nil) {
        
        [[FIRAuth auth] createUserWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable errorInRegistering) {
            
            
            if (errorInRegistering!=nil) {
                
                NSLog(@"%@", errorInRegistering);
            }
            
            else{
                
                    FIRDatabaseReference *referenceToDatabase = [[FIRDatabase database] referenceFromURL:@"https://chatapp-93255.firebaseio.com/"];
                
                FIRDatabaseReference *userReference = [[referenceToDatabase child:@"Users"]child:user.uid];
                
                NSDictionary *userDetails = @{ @"Name": name,
                                              @"Email": email};
                
                [userReference updateChildValues:userDetails];
                
                    [self dismissViewControllerAnimated:YES completion:nil];
                }

            
        }];
        
    }
    
}


-(void)handleTap:(UITapGestureRecognizer *)recognizer{
    
    NSLog(@"1234");
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)existingUserButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
