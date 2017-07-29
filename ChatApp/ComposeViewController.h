//
//  ComposeViewController.h
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/24/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase.h>
#import "UserBuilder.h"

@interface ComposeViewController : UITableViewController


@property(strong, nonatomic)UserBuilder *buildUser;
@property(strong, nonatomic)NSArray *emailAddress;
@property(strong, nonatomic)NSArray *name;

- (IBAction)cancelButtonPressed:(id)sender;

@end
