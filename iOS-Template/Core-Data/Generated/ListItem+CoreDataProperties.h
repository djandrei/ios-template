//
//  ListItem+CoreDataProperties.h
//  iOS-Template
//
//  Created by Andrei Dimitrief-Jianu on 2019-03-11.
//  Copyright © 2019 Andrei Dimitrief-Jianu. All rights reserved.
//
//

#import "ListItem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ListItem (CoreDataProperties)

+ (NSFetchRequest<ListItem *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *backendId;
@property (nullable, nonatomic, copy) NSDate *createdTimestamp;
@property (nullable, nonatomic, copy) NSDate *lastModifiedTimestamp;
@property (nullable, nonatomic, copy) NSString *synchronizationId;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *details;
@property (nullable, nonatomic, copy) NSString *subtitle;

@end

NS_ASSUME_NONNULL_END
