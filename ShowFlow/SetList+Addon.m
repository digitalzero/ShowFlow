//
//  SetList+Addon.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "SetList+Addon.h"

@implementation SetList (Addon)

+ (SetList *)createSetlistWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context;
{
    SetList *setlist = nil;
    
    setlist = [NSEntityDescription insertNewObjectForEntityForName:@"SetList" inManagedObjectContext:context];
        
    setlist.name = name;
    
    return setlist;
}

- (NSString *)totalRuntime {
    NSTimeInterval total = 0.0;
    for (Song *song in self.songs) {
        total += song.time.doubleValue;
    }
    long int hours = lround(floor(total / 3600.)) % 100;
    long int minutes = lround(floor(total / 60.)) % 60;
    long int seconds = lround(floor(total)) % 60;
    NSString *str = [[NSString alloc] init];
    
    str = [NSString stringWithFormat:@"%02li:%02li:%02li", hours, minutes, seconds];
    
    return str;
}

- (NSString *)description {
    NSString *string = [[NSString alloc] init];
    
    if (self.songs.count == 1) {
        string = [NSString stringWithFormat:@"%lu song - %@", (unsigned long)self.songs.count, [self totalRuntime]];
    } else
        string = [NSString stringWithFormat:@"%lu songs - %@", (unsigned long)self.songs.count, [self totalRuntime]];
    
    return string;
}

@end
