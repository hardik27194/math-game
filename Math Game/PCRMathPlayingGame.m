//
//  PCRMathPlayingGame.m
//  Math Game
//
//  Created by Prashant Raju on 3/20/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRMathPlayingGame.h"
#import "PCRNumberGenerator.h"

@implementation PCRMathPlayingGame

-(instancetype)initWithType:(NSString*)type
{
    self = [super init];
    
    if (self) {
        
        PCRNumberGenerator *numbers = [[PCRNumberGenerator alloc] init];
        
        NSNumber *one = numbers.firstNumber;
        NSNumber *two = numbers.secondNumber;
        int oneNumInt = [one intValue];
        int twoNumInt = [two intValue];
        
        if (oneNumInt > twoNumInt || oneNumInt == twoNumInt) {
            self.first = numbers.firstNumber;
            self.second = numbers.secondNumber;

        } else if (oneNumInt < twoNumInt){
            self.first = numbers.secondNumber;
            self.second = numbers.firstNumber;

        }
        
        int firstNumInt = [self.first intValue];
        int secondNumInt = [self.second intValue];
        
        if ([type isEqualToString:@"Addition"]) {
            int resultInt = firstNumInt + secondNumInt;
            self.result = @(resultInt);

        } else if ([type isEqualToString:@"Subtraction"]){
            int resultInt = firstNumInt - secondNumInt;
            self.result = @(resultInt);

        }
        
        
    }
    
    
    return self;
}

@end
