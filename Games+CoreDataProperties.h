//
//  Games+CoreDataProperties.h
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Games.h"

NS_ASSUME_NONNULL_BEGIN

@interface Games (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *gameType;
@property (nullable, nonatomic, retain) NSNumber *score;
@property (nullable, nonatomic, retain) User *whoPlayed;

@end

NS_ASSUME_NONNULL_END
