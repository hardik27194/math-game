//
//  User+User.h
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "User.h"

@interface User (User)

+(User *)userName:(NSString *)aUser inManagedObjectContext:(NSManagedObjectContext *)context;

@end
