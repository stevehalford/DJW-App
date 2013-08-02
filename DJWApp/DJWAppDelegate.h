//
//  DJWAppDelegate.h
//  DJWApp
//
//  Created by Steve Halford on 02/08/2013.
//  Copyright (c) 2013 Steve Halford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
