//
//  ListItem+CoreDataProperties.m
//  iOS-Template
//
//  Created by Andrei Dimitrief-Jianu on 2019-03-11.
//  Copyright © 2019 Andrei Dimitrief-Jianu. All rights reserved.
//
//

#import "ListItem+CoreDataProperties.h"

@implementation ListItem (CoreDataProperties)

+ (NSFetchRequest<ListItem *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ListItem"];
}

@dynamic backendId;
@dynamic createdTimestamp;
@dynamic lastModifiedTimestamp;
@dynamic synchronizationId;
@dynamic image;
@dynamic title;
@dynamic details;
@dynamic subtitle;

@end
