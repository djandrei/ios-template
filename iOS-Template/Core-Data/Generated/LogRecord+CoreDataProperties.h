//
//  LogRecord+CoreDataProperties.h
//  iOS-Template
//
//  Created by Andrei Dimitrief-Jianu on 2019-03-04.
//  Copyright © 2019 Andrei Dimitrief-Jianu. All rights reserved.
//
//

#import "LogRecord+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface LogRecord (CoreDataProperties)

+ (NSFetchRequest<LogRecord *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *backendId;
@property (nullable, nonatomic, copy) NSDate *createdTimestamp;
@property (nullable, nonatomic, copy) NSString *deviceId;
@property (nullable, nonatomic, copy) NSDate *lastModifiedTimestamp;
@property (nullable, nonatomic, copy) NSString *logCategory;
@property (nullable, nonatomic, copy) NSString *logData;
@property (nonatomic) int32_t logLevelInteger;
@property (nullable, nonatomic, copy) NSString *logLevelString;
@property (nullable, nonatomic, copy) NSString *logMessage;
@property (nullable, nonatomic, copy) NSString *synchronizationId;
@property (nullable, nonatomic, copy) NSString *username;

@end

NS_ASSUME_NONNULL_END
