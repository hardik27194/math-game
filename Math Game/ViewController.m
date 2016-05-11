//
//  ViewController.m
//  Math Game
//
//  Created by Prashant Raju on 3/16/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "ViewController.h"
#import "PCRMathPlayingGame.h"
#import "PCRQuestionView.h"
#import "PCRSummaryViewController.h"
#import "PCRGames.h"
#import "Games+Games.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *textWithQuestion;
@property (strong, nonatomic) PCRQuestionView *viewOne;
@property (strong, nonatomic) PCRQuestionView *viewTwo;
@property (strong, nonatomic) UIButton *buttonOne;
@property (strong, nonatomic) UIButton *buttonTwo;
@property (strong, nonatomic) UIButton *buttonThree;
@property (strong, nonatomic) UIButton *buttonFour;
@property (strong, nonatomic) UILabel *signLabel;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UILabel *questionLabel;
@property (strong, nonatomic) NSString *result;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger questions;





@end

@implementation ViewController

#pragma mark - View Controller
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.score = 0;
    self.questions = 0;

    CGSize size = self.view.frame.size;
    
    
        CGRect buttonView = CGRectMake(size.width - 350, 40, 99, 99);
        self.buttonOne = [[UIButton alloc] initWithFrame:buttonView];
        self.buttonOne.backgroundColor = [UIColor lightGrayColor];
        self.buttonOne.layer.borderWidth = 1.f;
        self.buttonOne.layer.borderColor = [UIColor blackColor].CGColor;
        [self.buttonOne addTarget:self
                   action:@selector(buttonOneSelected)
         forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.buttonOne];
    
    CGRect buttonTwoView = CGRectMake(size.width - 200, 40, 99, 99);
    self.buttonTwo = [[UIButton alloc] initWithFrame:buttonTwoView];
    self.buttonTwo.titleLabel.text = @"click here";
    self.buttonTwo.backgroundColor = [UIColor lightGrayColor];
    self.buttonTwo.layer.borderWidth = 1.f;
    self.buttonTwo.layer.borderColor = [UIColor blackColor].CGColor;
    [self.buttonTwo addTarget:self
               action:@selector(buttonTwoSelected)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonTwo];
    
    CGRect buttonThreeView = CGRectMake(size.width - 350, 180, 99, 99);
    self.buttonThree = [[UIButton alloc] initWithFrame:buttonThreeView];
    self.buttonThree.backgroundColor = [UIColor lightGrayColor];
    self.buttonThree.layer.borderWidth = 1.f;
    self.buttonThree.layer.borderColor = [UIColor blackColor].CGColor;
    [self.buttonThree addTarget:self
                       action:@selector(buttonThreeSelected)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonThree];
    
    CGRect buttonFourView = CGRectMake(size.width - 200, 180, 99, 99);
    self.buttonFour = [[UIButton alloc] initWithFrame:buttonFourView];
    self.buttonFour.titleLabel.text = @"click here";
    self.buttonFour.backgroundColor = [UIColor lightGrayColor];
    self.buttonFour.layer.borderWidth = 1.f;
    self.buttonFour.layer.borderColor = [UIColor blackColor].CGColor;
    [self.buttonFour addTarget:self
                       action:@selector(buttonFourSelected)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonFour];
    
    self.buttons = @[self.buttonOne, self.buttonTwo, self.buttonThree, self.buttonFour];
    
    CGRect labelView = CGRectMake(195, 170, 20, 20);
    self.signLabel = [[UILabel alloc] initWithFrame:labelView];
    self.signLabel.text = @"+";
    self.signLabel.font = [UIFont fontWithName:@"Gotham" size:50];
    [self.view addSubview:self.signLabel];
    
    
    CGRect numLabelView = CGRectMake(140, 360, 100, 20);
    self.questionLabel = [[UILabel alloc] initWithFrame:numLabelView];
    NSString *textForQuestionLabel = [NSString stringWithFormat:@"Question %ld", (long)self.questions];
    self.questionLabel.text = textForQuestionLabel;
    self.questionLabel.font = [UIFont fontWithName:@"Gotham" size:50];
    [self.view addSubview:self.questionLabel];
    
    [self newQuestion];
    
    
}

#pragma mark - Button
-(void)buttonOneSelected
{
    
    [self.scoreLabel removeFromSuperview];

    
    if (self.questions == 10 && [self.buttonOne.currentTitle isEqualToString:self.result]) {
        self.score += 1;

        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";

        [self presentViewController:vc animated:YES completion:nil];
        
    } else if  (self.questions == 10 && ![self.buttonOne.currentTitle isEqualToString:self.result]) {
    
        
        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";

        [self presentViewController:vc animated:YES completion:nil];
        
    } else if ([self.buttonOne.currentTitle isEqualToString:self.result]) {
        
    
    UIAlertController *alertController = [UIAlertController
                                          
                                          alertControllerWithTitle:@"Good Job!"
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   
                                   {
                                   }];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    self.score += 1;

    } else {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Incorrect"
                                              message:@"You'll get the next one!"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        

    }
    [self newQuestion];

}

-(void)buttonTwoSelected
{
    [self.scoreLabel removeFromSuperview];


    
    if (self.questions == 10 && [self.buttonOne.currentTitle isEqualToString:self.result]) {
        self.score += 1;
        
        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";

        [self presentViewController:vc animated:YES completion:nil];
        
    } else if  (self.questions == 10 && ![self.buttonOne.currentTitle isEqualToString:self.result]) {
        
        
        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";

        [self presentViewController:vc animated:YES completion:nil];
        
    }  else if ([self.buttonTwo.currentTitle isEqualToString:self.result]) {
        
        
        UIAlertController *alertController = [UIAlertController
                                              
                                              alertControllerWithTitle:@"Good Job!"
                                              message:nil
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       
                                       {
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        self.score += 1;
        
    } else {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Incorrect"
                                              message:@"You'll get the next one!"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
    }
    
    [self newQuestion];

    
}

-(void)buttonThreeSelected
{
    [self.scoreLabel removeFromSuperview];

    
    if (self.questions == 10 && [self.buttonOne.currentTitle isEqualToString:self.result]) {
        self.score += 1;
        
        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";

        [self presentViewController:vc animated:YES completion:nil];
        
    } else if  (self.questions == 10 && ![self.buttonOne.currentTitle isEqualToString:self.result]) {
        
        
        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";

        [self presentViewController:vc animated:YES completion:nil];
        
    }  else if ([self.buttonThree.currentTitle isEqualToString:self.result]) {
        
        
        UIAlertController *alertController = [UIAlertController
                                              
                                              alertControllerWithTitle:@"Good Job!"
                                              message:nil
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       
                                       {
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        self.score += 1;
        
    } else {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Incorrect"
                                              message:@"You'll get the next one!"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
    }
    [self newQuestion];

}

-(void)buttonFourSelected
{
    [self.scoreLabel removeFromSuperview];

    if (self.questions == 10 && [self.buttonOne.currentTitle isEqualToString:self.result]) {
        self.score += 1;
        
        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";
        
        [self presentViewController:vc animated:YES completion:nil];
        
    } else if  (self.questions == 10 && ![self.buttonOne.currentTitle isEqualToString:self.result]) {
        
        
        PCRSummaryViewController *vc = [[PCRSummaryViewController alloc] init];
        vc.score = self.score;
        vc.userName = self.userName;
        vc.type = @"Addition";

        
        [self presentViewController:vc animated:YES completion:nil];
        
    }  else if ([self.buttonFour.currentTitle isEqualToString:self.result]) {
        

        UIAlertController *alertController = [UIAlertController
                                              
                                              alertControllerWithTitle:@"Good Job!"
                                              message:nil
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       
                                       {
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        self.score += 1;
        
    } else {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Incorrect"
                                              message:@"You'll get the next one!"
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                       }];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
    }
    
    [self newQuestion];

}



-(void)newQuestion
{
    
    [self.viewOne removeFromSuperview];
    [self.viewTwo removeFromSuperview];
    
    self.questions += 1;

  
    
    NSString *textForQuestionLabel = [NSString stringWithFormat:@"Question %ld", (long)self.questions];
    self.questionLabel.text = textForQuestionLabel;
    
    
    PCRMathPlayingGame *game = [[PCRMathPlayingGame alloc] initWithType:@"Addition"];
    self.textWithQuestion = [NSString stringWithFormat:@"%@ + %@ =", game.first, game.second];
    
    NSNumber *total = game.result;
    NSNumber *oneN = [NSNumber numberWithInt:arc4random_uniform(21)];
    NSNumber *twoN = [NSNumber numberWithInt:arc4random_uniform(21)];
    NSNumber *threeN = [NSNumber numberWithInt:arc4random_uniform(21)];

    NSArray *choices = @[total, oneN, twoN, threeN];
    NSMutableArray *mutableChoices = [choices mutableCopy];

    
    
    NSUInteger count = [mutableChoices count];
    for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [mutableChoices exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
    NSString *textOne = [NSString stringWithFormat:@"%@", mutableChoices[0]];
    NSString *textTwo = [NSString stringWithFormat:@"%@", mutableChoices[1]];
    NSString *textThree = [NSString stringWithFormat:@"%@", mutableChoices[2]];
    NSString *textFour = [NSString stringWithFormat:@"%@", mutableChoices[3]];

    self.result = [NSString stringWithFormat:@"%@", total];

    [self.buttonOne setTitle:textOne forState:UIControlStateNormal];
    [self.buttonTwo setTitle:textTwo forState:UIControlStateNormal];
    [self.buttonThree setTitle:textThree forState:UIControlStateNormal];
    [self.buttonFour setTitle:textFour forState:UIControlStateNormal];
    
    CGSize size = self.view.frame.size;

    NSString *score = [NSString stringWithFormat:@"score: %ld", (long)self.score];
    CGRect scoreView = CGRectMake(size.width - 255, 360, 100, 20);
    self.scoreLabel = [[UILabel alloc] initWithFrame:scoreView];
    self.scoreLabel.font = [UIFont fontWithName:@"Gotham" size:50];
    self.scoreLabel.text = score;
    [self.view addSubview:self.scoreLabel];
    

   
        if (self.buttonOne.selected) {
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Good Job!"
                                                  message:nil
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            self.score += 1;
    }
    

    self.viewOne = [[PCRQuestionView alloc] initWithNumber:game.first
                                                sizeOfViewWidth:@300];
    self.viewOne.frame = CGRectMake(10, 10, 300, 200);
    [self.view addSubview:self.viewOne];
    
 
    
    self.viewTwo = [[PCRQuestionView alloc] initWithNumber:game.second
                                           sizeOfViewWidth:@300];
    self.viewTwo.frame = CGRectMake(10, 200, 300, 200);
    [self.view addSubview:self.viewTwo];

    
    NSLog(@"%ld", (long)self.questions);
    
   
    
    
}
@end
