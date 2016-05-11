//
//  Games+Games.h
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "Games.h"

@class PCRGames;

@interface Games (Games)

+(Games *)gameForStorage:(PCRGames *)aGame
  inManagedObjectContext:(NSManagedObjectContext *)context;


@end
