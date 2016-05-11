//
//  PCRAccountHistoryTableViewController.m
//  Math Game
//
//  Created by Prashant Raju on 3/24/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRAccountHistoryTableViewController.h"
#import "AppDelegate.h"
#import "Games.h"
#import "PCRHistoryTableViewCell.h"
#import "User.h"


@interface PCRAccountHistoryTableViewController ()

@property (strong, nonatomic) NSArray *arrayWithContent;

@end

@implementation PCRAccountHistoryTableViewController

#pragma mark - View Controller
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchDataFromCoreData];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithTitle:@"exit"
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(goHome)];
    self.navigationItem.leftBarButtonItem = dismiss;


    
}
#pragma mark - Actions
-(void)goHome{
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
   
}

#pragma mark - Core Data
-(void)fetchDataFromCoreData
{
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [del managedObjectContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    request.predicate = [NSPredicate predicateWithFormat:@"username = %@", self.user.username];
    request.returnsObjectsAsFaults = NO;
    [request setRelationshipKeyPathsForPrefetching:@[@"gamesPlayed"]];

    NSError *e;
    
    NSArray *array = [context executeFetchRequest:request
                                            error:&e];

    User *u = array[0];
    self.arrayWithContent = [u.gamesPlayed allObjects];
    

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayWithContent count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.f;
    
}


- (PCRHistoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PCRHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellR"];
    
    
    if (cell == nil) {
        Games *g = self.arrayWithContent[indexPath.row];
        
        NSDate *d = g.date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMMM dd, YYYY HH:mm"];
        NSString *dateString = [formatter stringFromDate:d];
        
        NSString *scoreString = [NSString stringWithFormat:@"Score: %@", g.score];


         cell = [[PCRHistoryTableViewCell alloc] initWithDate:dateString
                                                         type:g.gameType
                                                        score:scoreString
                                              reuseIdentifier:@"cellR"];
                 
        
        
        
    }
    
    return cell;
}


@end
