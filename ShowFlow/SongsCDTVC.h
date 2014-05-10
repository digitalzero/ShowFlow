//
//  SongsCDTVC.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/22/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "AddSongViewController.h"
#import "SetList+Addon.h"
#import "Song+Addon.h"
#import <iAd/iAd.h>

@interface SongsCDTVC : CoreDataTableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SetList *chosenSetlist;
@property (nonatomic, strong) UIManagedDocument *managedDocument;

@end
