//
//  PCRHistoryTableViewCell.m
//  Math Game
//
//  Created by Prashant Raju on 3/24/16.
//  Copyright © 2016 Prashant Raju. All rights reserved.
//

#import "PCRHistoryTableViewCell.h"

@implementation PCRHistoryTableViewCell

-(instancetype)initWithDate:(NSString *)aDate type:(NSString *)aType score:(NSString *)aScore reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super init];
    
    if (self) {
        
        reuseIdentifier = reuse;
        
        CGSize cellSize = self.contentView.superview.frame.size;

        self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, cellSize.width - 10, 30)];
        self.scoreLabel.text = aScore;
        self.scoreLabel.textAlignment = NSTextAlignmentCenter;

        [self addSubview:self.scoreLabel];
        
        self.typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 45, cellSize.width - 10, 30)];
        self.typeLabel.text = aType;
        self.typeLabel.textAlignment = NSTextAlignmentCenter;

        [self addSubview:self.typeLabel];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 85, cellSize.width - 10, 30)];
        self.dateLabel.text = aDate;
        self.dateLabel.textAlignment = NSTextAlignmentCenter;

        [self addSubview:self.dateLabel];
        
    }
    
    
    
    return self;
}
@end
