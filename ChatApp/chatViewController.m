//
//  chatViewController.m
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/23/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "chatViewController.h"
#import <Firebase.h>

@interface chatViewController ()

@end

@implementation chatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)logoutButtonPressed:(id)sender {
    
    [self signout];
    
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    
    if ([FIRAuth auth].currentUser.uid== nil) {
        [self signout];
    }
    
    else{
    NSString *uid = [FIRAuth auth].currentUser.uid;
    FIRDatabaseReference *reference = [[FIRDatabase database]reference];
    
    [[[reference child:@"Users"]child:uid]observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        self.title = snapshot.value[@"Name"];
        
    } withCancelBlock:^(NSError * _Nonnull error) {
        
        NSLog(@"%@", error.localizedDescription);
        
    }];

    }
    
}

-(void)signout{
    
    NSError *errorInLogout;
    [[FIRAuth auth] signOut:&errorInLogout];
    
    if (errorInLogout!=nil) {
        
        NSLog(@"%@", errorInLogout);
    }
    
    else{
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:vc animated:YES completion:nil];
      }
    
}

@end
