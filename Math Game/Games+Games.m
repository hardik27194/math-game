//
//  Games+Games.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "Games+Games.h"
#import "PCRGames.h"
#import "User+User.h"

@implementation Games (Games)

+(Games *)gameForStorage:(PCRGames *)aGame
   inManagedObjectContext:(NSManagedObjectContext *)context
{
    Games *g = nil;
    
    
        g = [NSEntityDescription insertNewObjectForEntityForName:@"Games"
                                              inManagedObjectContext:context];
    
        NSNumber *sc = [NSNumber numberWithInteger:aGame.score];
        g.score = sc;
        g.date = aGame.date;
        g.gameType = aGame.type;
        g.whoPlayed = [User userName:aGame.username
              inManagedObjectContext:context];
    
    return g;
}


@end
