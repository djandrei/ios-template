//
//  LogRecord+CoreDataProperties.m
//  iOS-Template
//
//  Created by Andrei Dimitrief-Jianu on 2019-03-04.
//  Copyright © 2019 Andrei Dimitrief-Jianu. All rights reserved.
//
//

#import "LogRecord+CoreDataProperties.h"

@implementation LogRecord (CoreDataProperties)

+ (NSFetchRequest<LogRecord *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"LogRecord"];
}

@dynamic backendId;
@dynamic createdTimestamp;
@dynamic deviceId;
@dynamic lastModifiedTimestamp;
@dynamic logCategory;
@dynamic logData;
@dynamic logLevelInteger;
@dynamic logLevelString;
@dynamic logMessage;
@dynamic synchronizationId;
@dynamic username;

@end
