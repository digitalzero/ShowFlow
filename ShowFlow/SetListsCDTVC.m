//
//  SetListsCDTVC.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "SetListsCDTVC.h"
#import "SetListsTableViewCell.h"
#import "SongsCDTVC.h"

@interface SetListsCDTVC ()

@property (nonatomic, strong) UIAlertView *setlistAlert;

@end

@implementation SetListsCDTVC

#pragma mark - View Methods

- (void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] addObserverForName:@"ManagedDocumentNotification"
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      self.managedDocument = note.userInfo[@"ManagedDocument"];
                                                  }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupFetchedResultsController];
    self.canDisplayBannerAds = YES;
}

- (IBAction)editButtonPressed:(UIBarButtonItem *)sender
{
    if ([self.tableView isEditing]) {
        [self.tableView setEditing:NO animated:YES];
        
    } else {
        [self.tableView setEditing:YES animated:YES];
    }
    [self.tableView reloadData];
}

- (IBAction)addButtonPressed:(UIBarButtonItem *)sender
{
    _setlistAlert = [[UIAlertView alloc] initWithTitle:@"Create Setlist" message:@"Enter a name for this setlist." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    
    _setlistAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [_setlistAlert textFieldAtIndex:0].placeholder = @"Name";
    [_setlistAlert textFieldAtIndex:0].autocapitalizationType = UITextAutocapitalizationTypeWords;
    [_setlistAlert textFieldAtIndex:0].returnKeyType = UIReturnKeyDone;
    [_setlistAlert show];
    
    [_setlistAlert textFieldAtIndex:0].delegate = self;
}


#pragma mark - TableView Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SetListsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SetList Cell"];
    SetList *setlist = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.firstTextField.text = setlist.name;
    cell.firstTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    if ([self.tableView isEditing]) {
        cell.firstTextField.userInteractionEnabled = YES;
    } else
        cell.firstTextField.userInteractionEnabled = NO;

    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SetList *setlist = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.managedDocument.managedObjectContext deleteObject:setlist];
    }
    
    [self.managedDocument saveToURL:self.managedDocument.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:nil];
}

/*
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
}
 */

#pragma mark - TextField Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == [_setlistAlert textFieldAtIndex:0]) {
        [self alertView:_setlistAlert clickedButtonAtIndex:1];
        [_setlistAlert dismissWithClickedButtonIndex:1 animated:YES];
    }
    
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""]) return;
    
    if ([textField.superview.superview.superview isKindOfClass:[UITableViewCell class]]) {
        UITableViewCell *cell = (UITableViewCell *)textField.superview.superview.superview;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        SetList *setlist = [self.fetchedResultsController objectAtIndexPath:indexPath];
        setlist.name = textField.text;
    }
    
    [self.managedDocument saveToURL:self.managedDocument.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return [(UITableView*)self.view isEditing];
}


#pragma mark - Data Methods

- (void)createSetlist:(NSString *)name
{
    [SetList createSetlistWithName:name inManagedObjectContext:self.managedDocument.managedObjectContext];
    [self.managedDocument saveToURL:self.managedDocument.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:nil];
}

- (void)setupFetchedResultsController
{
    NSManagedObjectContext *context = self.managedDocument.managedObjectContext;
    
    if (context) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"SetList"];
        request.predicate = nil;
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector:@selector(localizedStandardCompare:)]];
        
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                            managedObjectContext:context
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
    } else {
        self.fetchedResultsController = nil;
    }
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = nil;
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        indexPath = [self.tableView indexPathForCell:sender];
    }
    [self prepareViewController:segue.destinationViewController forSegue:segue.identifier fromIndexPath:indexPath];
}

- (void)prepareViewController:(id)vc forSegue:(NSString *)segueIdentifer fromIndexPath:(NSIndexPath *)indexPath
{
    SetList *setlist = [self.fetchedResultsController objectAtIndexPath:indexPath];
    // note that we don't check the segue identifier here
    if ([vc isKindOfClass:[SongsCDTVC class]]) {
        SongsCDTVC *songsCDTVC = (SongsCDTVC *)vc;
        songsCDTVC.chosenSetlist = setlist;
        songsCDTVC.managedDocument = self.managedDocument;
    }
}

#pragma mark - Alert View Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{    
    switch (buttonIndex) {
        case 1:
            [self createSetlist:[alertView textFieldAtIndex:0].text];
            break;
            
        default:
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
}



@end
