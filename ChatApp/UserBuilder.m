//
//  UserBuilder.m
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/27/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import "UserBuilder.h"
#import <Firebase.h>

@implementation UserBuilder



-(void)buildUsersForNewChat:(void(^)(BOOL successCode))sucessBlock{
    

 self.ref = [[FIRDatabase database]reference];
 self.names = [NSMutableArray array];
    self.emailAddress = [NSMutableArray array];
    
 [[_ref child:@"Users"]observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
 
 NSString *name = [[NSString alloc]initWithString:snapshot.value[@"Name"]];
     NSString *email = [[NSString alloc]initWithString:snapshot.value[@"Email"]];
     
     [self.names addObject:name];
     [self.emailAddress addObject:email];

     
         BOOL sucess = TRUE;
         sucessBlock(sucess);
         
     
 
 }];

}
 
@end
