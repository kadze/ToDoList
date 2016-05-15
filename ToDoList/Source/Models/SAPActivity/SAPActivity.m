//
//  SAPActivity.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPActivity.h"

#import "NSManagedObject+SAPExtensions.h"

static NSString * const kSAPSectionOutdated     = @"Outdated";
static NSString * const kSAPSectionActual       = @"Actual";
static NSString * const kSAPSectionCompleted    = @"Completed";

@implementation SAPActivity

//#warning temporaty comment for testing
@dynamic type;
@dynamic completed;
@dynamic note;
@dynamic date;
@dynamic section;

- (void)setType:(SAPActivityType)type {
    [self setCustomValue:@(type) forKey:NSStringFromSelector(@selector(type))];
}

- (NSString *)section {
    if (self.completed) {
        return kSAPSectionCompleted;
    }
    
    NSDate *currentDate = [NSDate date];
    if ([currentDate compare:self.date] == NSOrderedDescending) {
        return kSAPSectionOutdated;
    }
    
    return kSAPSectionActual;
}

@end
