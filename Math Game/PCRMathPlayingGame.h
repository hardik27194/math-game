//
//  PCRMathPlayingGame.h
//  Math Game
//
//  Created by Prashant Raju on 3/20/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCRMathPlayingGame : NSObject

/*
 Object that creates the game.
 */


@property (strong, nonatomic) NSNumber *first;
@property (strong, nonatomic) NSNumber *second;
@property (strong, nonatomic) NSNumber *result;

-(instancetype)initWithType:(NSString*)type;

@end
