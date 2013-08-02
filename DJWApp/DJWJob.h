//
//  DJWJob.h
//  DJWApp
//
//  Created by Steve Halford on 02/08/2013.
//  Copyright (c) 2013 Steve Halford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DJWJob : NSManagedObject

@property (nonatomic, retain) NSNumber * jobId;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * company;
@property (nonatomic, retain) NSString * descriptionText;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * createdAt;

@property (nonatomic, readonly) NSString *titleText;
@property (nonatomic, readonly) NSString *subtitleText;

@end
