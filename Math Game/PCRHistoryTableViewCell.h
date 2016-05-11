//
//  PCRHistoryTableViewCell.h
//  Math Game
//
//  Created by Prashant Raju on 3/24/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCRHistoryTableViewCell : UITableViewCell
{
    NSString *reuse;
}


@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UILabel *scoreLabel;

-(instancetype)initWithDate:(NSString *)aDate type:(NSString *)aType score:(NSString *)aScore reuseIdentifier:(NSString *)reuseIdentifier;

@end
