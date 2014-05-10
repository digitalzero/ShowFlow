//
//  AddSongViewController.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/22/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "AddSongViewController.h"

@interface AddSongViewController ()

@property (weak, nonatomic) IBOutlet UITextField *songNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *songBPMTextField;

@end

@implementation AddSongViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.songNameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.songNameTextField.returnKeyType = UIReturnKeyDone;
    
    self.songBPMTextField.keyboardType = UIKeyboardTypeDecimalPad;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
    // [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    if ([self.songNameTextField.text isEqualToString:@""]) {
        return;
    } else {
        [self createSong:self.songNameTextField.text];  // Create a song and assign it's name
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];  // Dismiss current view
    }
}

- (void)createSong:(NSString *)name
{
    [Song createSongWithName:name inSetList:self.chosenSetlist inManagedObjectContext:self.chosenSetlist.managedObjectContext];
}
@end
