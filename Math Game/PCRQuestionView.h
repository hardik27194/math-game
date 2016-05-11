//
//  PCRQuestionView.h
//  Math Game
//
//  Created by Prashant Raju on 3/20/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCRQuestionView : UIView

/*
Custom view that presents the objects to the player
 */


-(instancetype)initWithNumber:(NSNumber *)number sizeOfViewWidth:(NSNumber *)sizeOfWidth;
@property (strong, nonatomic) UIView *circleView;

@end
