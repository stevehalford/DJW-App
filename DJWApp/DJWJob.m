//
//  DJWJob.m
//  DJWApp
//
//  Created by Steve Halford on 02/08/2013.
//  Copyright (c) 2013 Steve Halford. All rights reserved.
//

#import "DJWJob.h"


@implementation DJWJob

@dynamic jobId;
@dynamic city;
@dynamic company;
@dynamic descriptionText;
@dynamic title;
@dynamic createdAt;

- (NSString *)titleText
{
    return [self.title length] ? self.title : @"(untitled)";
}

- (NSString *)subtitleText
{
    return [self.company length] ? [NSString stringWithFormat:@"at %@ in %@", self.company, self.city] : @"(untitled)";
}

@end
