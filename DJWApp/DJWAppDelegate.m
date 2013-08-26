#import <RestKit/RestKit.h>
#import "DJWAppDelegate.h"
#import "DJWMasterViewController.h"

@implementation DJWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSError *error = nil;
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"DJWApp" ofType:@"momd"]];
    // NOTE: Due to an iOS 5 bug, the managed object model returned is immutable.
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];

    // Initialize the Core Data stack
    [managedObjectStore createPersistentStoreCoordinator];

    NSPersistentStore __unused *persistentStore = [managedObjectStore addInMemoryPersistentStore:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);

    [managedObjectStore createManagedObjectContexts];

    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:managedObjectStore];

    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://api.designjobswales.co.uk"]];
    objectManager.managedObjectStore = managedObjectStore;

    [RKObjectManager setSharedManager:objectManager];

    RKEntityMapping *entityMapping = [RKEntityMapping mappingForEntityForName:@"Job" inManagedObjectStore:managedObjectStore];
    [entityMapping addAttributeMappingsFromDictionary:@{
     @"id":             @"jobId",
     @"title":          @"title",
     @"description":    @"descriptionText",
     @"company":        @"company",
     @"city":           @"city",
     @"created_on":     @"createdAt",
     @"url":            @"url"}];
    entityMapping.identificationAttributes = @[ @"jobId" ];

    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:entityMapping pathPattern:@"/jobs" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

    [objectManager addResponseDescriptor:responseDescriptor];

    // Override point for customization after application launch.
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    DJWMasterViewController *controller = (DJWMasterViewController *)navigationController.topViewController;
    controller.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    return YES;
}

@end