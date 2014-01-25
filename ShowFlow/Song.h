//
//  Song.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SetList;

@interface Song : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic, retain) NSNumber * bpm;
@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSString * timecode;
@property (nonatomic, retain) SetList *whichList;

@end
