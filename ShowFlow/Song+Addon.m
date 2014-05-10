//
//  Song+Addon.m
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import "Song+Addon.h"
#import "SetList+Addon.h"

@implementation Song (Addon)

+ (Song *)createSongWithName:(NSString *)name inSetList:(SetList *)setlist inManagedObjectContext:(NSManagedObjectContext *)context;
{
    Song *song = nil;
    
    song = [NSEntityDescription insertNewObjectForEntityForName:@"Song" inManagedObjectContext:context];
    
    song.name = name;
    song.bpm = [NSNumber numberWithInt:120];
    song.key = @"";
    song.time = [NSNumber numberWithInt:0];
    song.timecode = @"01:00:00:00";
    
    song.whichList = setlist;
    
    NSLog(@"Song created with name %@", song.name);
    
    return song;
}


- (NSString *)totalRuntime {
    long int hours = lround(floor(self.time.doubleValue / 3600.)) % 100;
    long int minutes = lround(floor(self.time.doubleValue / 60.)) % 60;
    long int seconds = lround(floor(self.time.doubleValue)) % 60;
    
    NSString *str = [[NSString alloc] init];
    
    if (hours == 0) {
        str = [NSString stringWithFormat:@"%.1li:%02li", minutes, seconds];
    } else
        str = [NSString stringWithFormat:@"%li:%02li:%02li", hours, minutes, seconds];
    
    return str;
}

- (NSString *)description {
    NSString *string = [NSString stringWithFormat:@"%@   %.2fbpm   %@", self.totalRuntime, self.bpm.floatValue, self.key];
    
    return string;
}
@end
