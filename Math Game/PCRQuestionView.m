//
//  PCRQuestionView.m
//  Math Game
//
//  Created by Prashant Raju on 3/20/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRQuestionView.h"

@implementation PCRQuestionView

-(instancetype)initWithNumber:(NSNumber *)number sizeOfViewWidth:(NSNumber *)sizeOfWidth;
{
    self = [super init];
    
    if (self) {
        
        int sizeOfW = [sizeOfWidth intValue];
        
        int num = [number intValue];
        
        NSArray *colors = @[[UIColor blueColor], [UIColor greenColor], [UIColor redColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor magentaColor], [UIColor yellowColor], [UIColor magentaColor]];
        
        NSInteger colorInt = arc4random_uniform(8);
        UIColor *chosenColor = colors[colorInt];
        
        if (num < 6) {
            
            for (int i = 1; i <= num; i++) {
                
            
                
                int x = (.18 * sizeOfW) * i;
                
                CGRect circleFrame = CGRectMake(x, 20, (.18 * sizeOfW), (.18 * sizeOfW));
                
                self.circleView= [[UIView alloc] initWithFrame:circleFrame];
                self.circleView.layer.cornerRadius = (self.circleView.frame.size.width / 2);
                self.circleView.layer.borderWidth = 1.f;
                self.circleView.layer.borderColor = [UIColor blackColor].CGColor;
                self.circleView.backgroundColor = chosenColor;
                [self addSubview:self.circleView];
                
                
                UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
                
                UIGravityBehavior* gravityBehavior =
                [[UIGravityBehavior alloc] initWithItems:@[self.circleView]];
                [animator addBehavior:gravityBehavior];
                
                UICollisionBehavior* collisionBehavior =
                [[UICollisionBehavior alloc] initWithItems:@[self.circleView]];
                collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
                [animator addBehavior:collisionBehavior];
                
                UIDynamicItemBehavior *elasticityBehavior =
                [[UIDynamicItemBehavior alloc] initWithItems:@[self.circleView]];
                elasticityBehavior.elasticity = 0.7f;
                [animator addBehavior:elasticityBehavior];

                
            }
            
  
        } else if (num > 5 && num <= 10) {
            
            for (int i = 1; i <= num; i++) {
                
                int x;
                int y;
                
                if (i > 0 && i < 6) {
                    x = (.18 * sizeOfW) * i;
                    y = 20;

                } else if (i > 5 && i <= 10){
                    x = (.18 * sizeOfW) * (i-5);

                    y = 80;
                }
                
                CGRect circleFrame = CGRectMake(x, y, (.18 * sizeOfW), (.18 * sizeOfW));
                
                self.circleView = [[UIView alloc] initWithFrame:circleFrame];
                self.circleView.layer.cornerRadius = (self.circleView.frame.size.width / 2);
                self.circleView.layer.borderWidth = 1.f;
                self.circleView.layer.borderColor = [UIColor blackColor].CGColor;
                self.circleView.backgroundColor = chosenColor;
                [self addSubview:self.circleView];
                
                UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
                
                UIGravityBehavior* gravityBehavior =
                [[UIGravityBehavior alloc] initWithItems:@[self.circleView]];
                [animator addBehavior:gravityBehavior];
                
                UICollisionBehavior* collisionBehavior =
                [[UICollisionBehavior alloc] initWithItems:@[self.circleView]];
                collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
                [animator addBehavior:collisionBehavior];
                
                UIDynamicItemBehavior *elasticityBehavior =
                [[UIDynamicItemBehavior alloc] initWithItems:@[self.circleView]];
                elasticityBehavior.elasticity = 0.7f;
                [animator addBehavior:elasticityBehavior];
                
                
            }
            

            
            
            
            
        }
        
        
        
    }
    
    
    
    return self;
}


@end
