//
//  Song+Addon.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "Song.h"

@interface Song (Addon)

+ (Song *)createSongWithName:(NSString *)name inSetList:(SetList *)setlist inManagedObjectContext:(NSManagedObjectContext *)context;

- (NSString *)totalRuntime;

@end
