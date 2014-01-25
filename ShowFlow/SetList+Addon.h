//
//  SetList+Addon.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "SetList.h"
#import "Song.h"

@interface SetList (Addon)

+ (SetList *)createSetlistWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context;

- (NSString *)totalRuntime;

@end
