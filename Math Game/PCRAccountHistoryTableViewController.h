//
//  PCRAccountHistoryTableViewController.h
//  Math Game
//
//  Created by Prashant Raju on 3/24/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface PCRAccountHistoryTableViewController : UITableViewController

/*
 View controller that shows the summary of a user.
 */

@property (nonatomic, strong) User *user;


@end
