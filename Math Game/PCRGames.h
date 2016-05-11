//
//  PCRGames.h
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCRGames : NSObject

/*
 Object that is used to record a game
 */

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *type;

@property (nonatomic) NSInteger score;
@property (nonatomic, strong) NSDate *date;

-(instancetype)initWithUser:(NSString *)aUserName score:(NSInteger)aScore date:(NSDate *)aDate type:(NSString *)aType;

@end
