//
//  User+CoreDataProperties.h
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSSet<Games *> *gamesPlayed;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addGamesPlayedObject:(Games *)value;
- (void)removeGamesPlayedObject:(Games *)value;
- (void)addGamesPlayed:(NSSet<Games *> *)values;
- (void)removeGamesPlayed:(NSSet<Games *> *)values;

@end

NS_ASSUME_NONNULL_END
