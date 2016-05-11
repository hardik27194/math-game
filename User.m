//
//  User.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "User.h"
#import "Games.h"

@implementation User

// Insert code here to add functionality to your managed object subclass
/*
 @dynamic username;
 @dynamic gamesPlayed;
 */

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", [self class], @{@"username":self.username, @"games played":[NSNumber numberWithUnsignedLong:[self.gamesPlayed count]]}];
}


@end
