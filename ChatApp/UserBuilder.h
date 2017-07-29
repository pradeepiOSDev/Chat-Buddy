//
//  UserBuilder.h
//  ChatApp
//
//  Created by pradeep gunasekaran on 7/27/17.
//  Copyright © 2017 pradeep gunasekaran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase.h>


@interface UserBuilder : NSObject

@property(strong, nonatomic)FIRDatabaseReference *ref;
@property(strong, nonatomic) NSMutableArray *names;
@property(strong, nonatomic) NSMutableArray *emailAddress;

- (void)buildUsersForNewChat:(void(^)(BOOL successCode))sucessBlock;



@end
