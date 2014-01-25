//
//  AddSetListViewController.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/22/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "AddSetListViewController.h"
#import "SetList+Addon.h"

@interface AddSetListViewController () <UITextFieldDelegate>

@property (nonatomic, readwrite) SetList *setlist;
@property (weak, nonatomic) IBOutlet UITextField *setlistNameTextField;

@end

@implementation AddSetListViewController


- (IBAction)cancelAndDismiss:(UIBarButtonItem *)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
