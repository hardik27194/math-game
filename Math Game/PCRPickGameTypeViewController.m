//
//  PCRPickGameTypeViewController.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRPickGameTypeViewController.h"
#import "User+User.h"
#import "Games.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "PCRHomeViewController.h"
#import "PCRAccountHistoryTableViewController.h"
#import "PCRSubtractionViewController.h"


@interface PCRPickGameTypeViewController ()
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSNumber *score;
@property (strong, nonatomic) UILabel *labelWithInstructions;
@property (strong, nonatomic)  UILabel *labelWithRecord;
@property (getter=theNewGame) UIButton *newGame;


@end

@implementation PCRPickGameTypeViewController

#pragma mark - View Controller
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    CGSize size = self.view.frame.size;
    
    [self fetchUserFromCoreData];
    [self getScore];


    CGRect viewOfInstrucitons = CGRectMake(20, 20, size.width - 50, 20);
    self.labelWithInstructions = [[UILabel alloc] initWithFrame:viewOfInstrucitons];
    self.labelWithInstructions.text = self.username;
    self.labelWithInstructions.numberOfLines = 0;
    self.labelWithInstructions.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.labelWithInstructions];

    NSString *num;
    
    if (self.user.gamesPlayed.count) {
        num = [NSString stringWithFormat:@"you scored %@ points over %lu games played ", self.score, self.user.gamesPlayed.count];
    } else {
        num = @"Play you first game now!";
    }
    
    CGRect viewOfRecord = CGRectMake(20, 50, size.width - 50, 20);
    self.labelWithRecord = [[UILabel alloc] initWithFrame:viewOfRecord];
    self.labelWithRecord.text = num;
    self.labelWithRecord.numberOfLines = 0;
    self.labelWithRecord.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.labelWithRecord];

    
    CGRect buttonView = CGRectMake(100, 200, 200, 80);
    self.newGame = [[UIButton alloc] initWithFrame:buttonView];
    self.newGame.backgroundColor = [UIColor purpleColor];
    [self.newGame setTitle:@"New Addition Game" forState:UIControlStateNormal];
    [self.newGame addTarget:self action:@selector(createAdditionNewGame)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.newGame];
    
    CGRect buttonHistoryView = CGRectMake(10, (size.height - 60), 140, 50);
    UIButton *historyButton = [[UIButton alloc] initWithFrame:buttonHistoryView];
    historyButton.backgroundColor = [UIColor greenColor];
    [historyButton setTitle:@"History" forState:UIControlStateNormal];
    [historyButton addTarget:self action:@selector(playerHistory)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:historyButton];

    CGRect buttonSubtractionView = CGRectMake((size.width - 300), 200, 200, 80);
    UIButton *newSubstractionGame = [[UIButton alloc] initWithFrame:buttonSubtractionView];
    newSubstractionGame.backgroundColor = [UIColor blueColor];
    [newSubstractionGame setTitle:@"New Subtraction Game" forState:UIControlStateNormal];
    [newSubstractionGame addTarget:self action:@selector(createSubtractionNewGame)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newSubstractionGame];
    
    
    CGRect buttonDeleteView = CGRectMake((size.width - 150), (size.height - 60), 140, 50);
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:buttonDeleteView];
    deleteButton.backgroundColor = [UIColor redColor];
    [deleteButton setTitle:@"Delete Account" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteAccount)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    CGRect buttonHomeView = CGRectMake((size.width - 140)/2, (size.height - 60), 140, 50);
    UIButton *homeButton = [[UIButton alloc] initWithFrame:buttonHomeView];
    homeButton.backgroundColor = [UIColor lightGrayColor];
    [homeButton setTitle:@"Home" forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(goHome)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:homeButton];

}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.newGame removeFromSuperview];
    [self.labelWithInstructions removeFromSuperview];
    [self.labelWithRecord removeFromSuperview];

    
    
}
#pragma mark - Core Data
-(void)fetchUserFromCoreData
{
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =[del managedObjectContext];

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    request.predicate = [NSPredicate predicateWithFormat:@"username = %@", self.username];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    self.user = matches[0];
}

-(void)getScore
{
    NSUInteger score = 0;
    NSArray *ga = [self.user.gamesPlayed allObjects];
    for (int i = 1; i <= self.user.gamesPlayed.count; i++) {
        Games *n = ga[i-1];
        NSInteger s = [n.score integerValue];
        score += s;
        
    }
    
    self.score = [NSNumber numberWithUnsignedInteger:score];
    
}
-(void)deleteAccount
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are You Sure"
                                                                   message:@"If you delete the account, the history will be lost forever."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"Yes"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action){
                                                    
                                                    AppDelegate *del = [[UIApplication sharedApplication] delegate];
                                                    NSManagedObjectContext *context =[del managedObjectContext];
                                                    
                                                    [context deleteObject:self.user];
                                                    NSError *error;
                                                    [context save:&error];
                                                    
                                                    [self goHome];
                                                    
                                                }];
    [alert addAction:yes];
    
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"No"
                                                 style:UIAlertActionStyleCancel
                                               handler:nil];
    [alert addAction:no];
    
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
    
}


#pragma mark - Actions
-(void)createAdditionNewGame
{
    ViewController *vc = [[ViewController alloc] init];
    vc.userName = self.user.username;
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
    
    
}

-(void)createSubtractionNewGame
{
    PCRSubtractionViewController *vc = [[PCRSubtractionViewController alloc] init];
    vc.userName = self.user.username;
    [self presentViewController:vc
                       animated:YES
                     completion:nil];

}
-(void)playerHistory
{
    PCRAccountHistoryTableViewController *vc = [[PCRAccountHistoryTableViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.user = self.user;
    [self presentViewController:nav
                       animated:YES
                     completion:nil];
}

-(void)goHome
{
    PCRHomeViewController *vc = [[PCRHomeViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}




@end
