//
//  User+User.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "User+User.h"

@implementation User (User)

+(User *)userName:(NSString *)aUser inManagedObjectContext:(NSManagedObjectContext *)context
{
    User *user = nil;
    
    
    if ([aUser length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        request.predicate = [NSPredicate predicateWithFormat:@"username = %@", aUser];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || error || ([matches count] > 1)) {
            NSLog(@"error with Fetch of user");
        } else if (![matches count]){
            user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                 inManagedObjectContext:context];
            user.username = aUser;

        } else {
            user = [matches lastObject];
        }
    }
    
    
    return user;
}


@end
