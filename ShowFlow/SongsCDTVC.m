//
//  SongsCDTVC.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/22/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "SongsCDTVC.h"

@interface SongsCDTVC ()

@end

@implementation SongsCDTVC

#pragma mark - View Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.chosenSetlist.name;
    [self setupFetchedResultsController];
    self.canDisplayBannerAds = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.managedDocument saveToURL:self.managedDocument.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:nil];    
}

#pragma mark - TableView Cell Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Song Cell"];
    Song *song = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = song.name;
    cell.detailTextLabel.text = song.totalRuntime;
    // cell.firstTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    
    return cell;
}

#pragma mark - Data Methods

- (void)setupFetchedResultsController
{
    NSManagedObjectContext *context = self.chosenSetlist.managedObjectContext;
    
    if (context) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Song"];
        request.predicate = [NSPredicate predicateWithFormat:@"whichList = %@", self.chosenSetlist];
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
    if ([segueIdentifer isEqualToString:@"Add Song"]) {
        //if ([vc isKindOfClass:[AddSongViewController class]]) {
            AddSongViewController *addSongVC = (AddSongViewController *)vc;
            addSongVC.chosenSetlist = self.chosenSetlist;
        //}
    
    }
}

@end
