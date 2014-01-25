//
//  ShowFlowAppDelegate.h
//  ShowFlow
//
//  Created by Demetrius Henry on 1/21/14.
//  Copyright (c) 2014 Digital Zero, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowFlowAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIManagedDocument *managedDocument;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
