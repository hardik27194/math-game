//
//  PCRSummaryViewController.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRSummaryViewController.h"
#import "ViewController.h"
#import "PCRHomeViewController.h"
#import "AppDelegate.h"
#import "PCRGames.h"
#import "Games+Games.h"

@implementation PCRSummaryViewController

#pragma mark - view Controller
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDate *date = [NSDate date];
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = del.managedObjectContext;
    PCRGames *ga = [[PCRGames alloc] initWithUser:self.userName
                                            score:self.score
                                             date:date
                                             type:self.type];
    
    [Games gameForStorage:ga inManagedObjectContext:context];

    NSError* error = nil;
    [context save:&error];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"score %lu", self.score);
    
    CGSize size = self.view.frame.size;

    
   

    
    
    NSString *messageTwo;
    NSString *message;
    
    if (self.score == 0) {
        messageTwo = @"You didn't score any points. Score big next time!";
        message = [NSString stringWithFormat:@"Oh No!"];

    } else if (self.score == 1){
        messageTwo = [NSString stringWithFormat:@"You earned %lu point", self.score];
        message = [NSString stringWithFormat:@"Congratulations!"];

    } else {
        messageTwo = [NSString stringWithFormat:@"You earned %lu points", self.score];
        message = [NSString stringWithFormat:@"Congratulations!"];


    }
    
    CGRect labelView = CGRectMake(20, 20, (size.width - 40), 40);
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:labelView];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.text = message;
    [self.view addSubview:messageLabel];

    
    CGRect labelTwoView = CGRectMake(20, 65, (size.width - 40), 40);
    UILabel *messageTwoLabel = [[UILabel alloc] initWithFrame:labelTwoView];
    messageTwoLabel.textAlignment = NSTextAlignmentCenter;
    messageTwoLabel.text = messageTwo;
    [self.view addSubview:messageTwoLabel];
    
    
    CGRect buttonView = CGRectMake(100, 200, 120, 80);
    UIButton *newGame = [[UIButton alloc] initWithFrame:buttonView];
    newGame.backgroundColor = [UIColor lightGrayColor];
    [newGame setTitle:@"Play Again" forState:UIControlStateNormal];
    [newGame addTarget:self action:@selector(createNewGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newGame];
    
    
    
    CGRect buttonHomeView = CGRectMake((size.width - 220), 200, 120, 80);
    UIButton *homeButton = [[UIButton alloc] initWithFrame:buttonHomeView];
    homeButton.backgroundColor = [UIColor lightGrayColor];
    [homeButton setTitle:@"Go Home" forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(goHomeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homeButton];

    
}

#pragma mark - Actions
-(void)createNewGame
{
    ViewController *vc = [[ViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];

    
}

-(void)goHomeAction
{
    PCRHomeViewController *vc = [[PCRHomeViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];

}

@end
