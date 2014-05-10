//
//  SetListsCDTVC.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "SetList+Addon.h"
#import <iAd/iAd.h>


@interface SetListsCDTVC : CoreDataTableViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UIManagedDocument *managedDocument;


@end
