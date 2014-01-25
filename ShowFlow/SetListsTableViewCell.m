//
//  SetListsTableViewCell.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/23/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "SetListsTableViewCell.h"


@implementation SetListsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*
- (void)willTransitionToState:(UITableViewCellStateMask)state
{
    [super willTransitionToState:state];
    
    switch (state) {
        case UITableViewCellStateDefaultMask:
            self.userInteractionEnabled = NO;
            break;
        case UITableViewCellStateShowingEditControlMask:
            self.userInteractionEnabled = YES;
            break;
            
        default:
            break;
    }
}
 */

@end
