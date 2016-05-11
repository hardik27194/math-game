//
//  PCRGames.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRGames.h"

@implementation PCRGames

-(instancetype)initWithUser:(NSString *)aUserName score:(NSInteger)aScore date:(NSDate *)aDate type:(NSString *)aType
{
    self = [super init];
    
    if (self) {
        
        _username = aUserName;
        _score = aScore;
        _date = aDate;
        _type = aType;
        
        
    }
    
    return self;
    
}


@end
