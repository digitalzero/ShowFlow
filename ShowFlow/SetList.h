//
//  SetList.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Song;

@interface SetList : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *songs;
@end

@interface SetList (CoreDataGeneratedAccessors)

- (void)addSongsObject:(Song *)value;
- (void)removeSongsObject:(Song *)value;
- (void)addSongs:(NSSet *)values;
- (void)removeSongs:(NSSet *)values;

@end
