//
//  PCRNumberGenerator.m
//  Math Game
//
//  Created by Prashant Raju on 3/20/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRNumberGenerator.h"

@implementation PCRNumberGenerator

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        NSInteger first = arc4random_uniform(9) + 1;
        self.firstNumber = @(first);
        
        NSInteger second = arc4random_uniform(9) + 1;
        self.secondNumber = @(second);
    }
    
    return self;
}

@end
