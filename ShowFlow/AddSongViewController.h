//
//  AddSongViewController.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/22/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetList+Addon.h"
#import "Song+Addon.h"

@interface AddSongViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) SetList *chosenSetlist;

@end
