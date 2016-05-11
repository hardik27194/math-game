//
//  PCRHomeViewController.m
//  Math Game
//
//  Created by Prashant Raju on 3/22/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRHomeViewController.h"
#import "AppDelegate.h"
#import "User+User.h"
#import "PCRPickGameTypeViewController.h"


@interface PCRHomeViewController()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *arrayWithUserst;
@property (strong, nonatomic) NSString *name;
@end


@implementation PCRHomeViewController

#pragma mark - View Controller
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    
    CGSize size = self.view.frame.size;
    
    CGRect viewOfTable = CGRectMake(10, 10, (size.width - 10)/2, (size.height - 20));
    UITableView *listOfUsersTable = [[UITableView alloc] initWithFrame:viewOfTable
                                                                 style:UITableViewStylePlain];
    
    [self.view addSubview:listOfUsersTable];
    
    listOfUsersTable.dataSource = self;
    listOfUsersTable.delegate = self;
    
    [self fetchDataFromCoreData];
    
    CGRect viewOfInstrucitons = CGRectMake((size.width/2)+30, 10, (size.width - 90)/2, 80);
    UILabel *labelWithInstructions = [[UILabel alloc] initWithFrame:viewOfInstrucitons];
    labelWithInstructions.text = @"Pick a User To Play Or Create a New Account";
    labelWithInstructions.numberOfLines = 0;
    labelWithInstructions.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelWithInstructions];
    
    CGRect viewOfBtton = CGRectMake((size.width/2)+30, 100, (size.width - 90)/2, 80);
    UIButton *createNewUserButton = [[UIButton alloc] initWithFrame:viewOfBtton];
    [createNewUserButton addTarget:self
                            action:@selector(createNewUser)
                  forControlEvents:UIControlEventTouchUpInside];
    [createNewUserButton setTitle:@"Create New"
                         forState:UIControlStateNormal];
    createNewUserButton.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:createNewUserButton];

    
}

#pragma mark - Actions
-(void)createNewUser
{

    UIAlertController *createNew = [UIAlertController alertControllerWithTitle:@"Username"
                                          message:@"type in your username"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [createNew addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Username";
    }];

    UIAlertAction *newAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   
                                   {
                                       self.name = createNew.textFields.firstObject.text;
                                       AppDelegate *del = [[AppDelegate alloc] init];
                                       NSManagedObjectContext *context = del.managedObjectContext;
                                       
                                       [User userName:self.name
                               inManagedObjectContext:context];
                                       
                                       PCRPickGameTypeViewController *vc = [[PCRPickGameTypeViewController alloc] init];
                                       vc.username = self.name;
                                       [self presentViewController:vc
                                                          animated:YES
                                                        completion:nil];
                                       NSError *e;
                                       [context save:&e];
                                       
                                   }];
    
    
    [createNew addAction:newAction];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   
                                   {
                                       
                                   }];
    
    
    [createNew addAction:cancelAction];


    
    [self presentViewController:createNew animated:YES completion:nil];

}

#pragma mark - Core Data
-(void)fetchDataFromCoreData
{
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =[del managedObjectContext];
    
    NSString *entity = [NSString stringWithFormat:@"User"];
    
    NSFetchRequest *fet = [NSFetchRequest fetchRequestWithEntityName:entity];
    fet.returnsObjectsAsFaults = NO;
    [fet setRelationshipKeyPathsForPrefetching:@[@"gamesPlayed"]];
    
    NSError *e;
    
    NSArray *array = [context executeFetchRequest:fet
                                            error:&e];
    
    
    self.arrayWithUserst = [[NSMutableArray alloc] init];
    self.arrayWithUserst = [array mutableCopy];
    
}

#pragma mark - Table View
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.arrayWithUserst count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"userCell"];
        
        User *user = [self.arrayWithUserst objectAtIndex:indexPath.row];
        self.name = [NSString stringWithFormat:@"%@", user.username];
        cell.textLabel.text = self.name;
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    PCRPickGameTypeViewController *vc = [[PCRPickGameTypeViewController alloc] init];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *u = cell.textLabel.text;
    vc.username = u;
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
    
    
}




@end
