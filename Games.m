//
//  Games.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "Games.h"
#import "User.h"

@implementation Games

// Insert code here to add functionality to your managed object subclass

/*
 
 @dynamic date;
 @dynamic gameType;
 @dynamic score;
 @dynamic whoPlayed;
 */

-(NSString *)description
{
    
    return [NSString stringWithFormat:@"%@, %@", [self class], @{@"date":self.date, @"gameType":self.gameType, @"score":self.score, @"player":self.whoPlayed}];
    
}

@end
