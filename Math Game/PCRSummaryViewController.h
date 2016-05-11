//
//  PCRSummaryViewController.h
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCRSummaryViewController : UIViewController

/*
 View controller that is loaded after a game is over with the summary of the game.
 */

@property (nonatomic) NSInteger score;
@property (nonatomic, strong) NSString *userName;
@property (nonnull, strong) NSString *type;

@end
