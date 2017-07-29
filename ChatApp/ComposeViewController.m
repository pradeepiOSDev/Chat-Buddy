//
//  ComposeViewController.m
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/24/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"New Chat";
    
    UserBuilder *user = [[UserBuilder alloc]init];
    [user buildUsersForNewChat:^(BOOL successCode) {
        
        if (successCode) {
            
            self.emailAddress = user.emailAddress;
            self.name = user.names;
            
            dispatch_async(dispatch_get_main_queue(), ^{
           
                [self.tableView reloadData];
                
            });
            
        }
        
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.name.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComposeCell"];
    cell.textLabel.text = self.name[indexPath.row];
    return cell;
}


- (IBAction)cancelButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
