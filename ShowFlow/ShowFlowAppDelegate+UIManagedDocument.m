//
//  ShowFlowAppDelegate+UIManagedDocument.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/23/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "ShowFlowAppDelegate+UIManagedDocument.h"
#import <CoreData/CoreData.h>


@implementation ShowFlowAppDelegate (UIManagedDocument)

- (UIManagedDocument *)createDocument
{
    NSURL *docURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ShowFlowDocument"];
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:docURL];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    document.persistentStoreOptions = options;
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[docURL path]];
    
    if (fileExists) [document openWithCompletionHandler:nil];
    else [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:nil];
    
    if (self.managedDocument.documentState == UIDocumentStateNormal) {
        return document;
    } else return nil;
}


// Returns the URL to the application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}






@end
