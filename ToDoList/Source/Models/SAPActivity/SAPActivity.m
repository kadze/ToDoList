//
//  SAPActivity.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPActivity.h"

#import "NSManagedObject+SAPExtensions.h"

@implementation SAPActivity

//#warning temporaty comment for testing
@dynamic type;
@dynamic status;
@dynamic note;
@dynamic date;

#pragma mark -
#pragma mark Accessors

- (void)setType:(SAPActivityType)type {
    [self setCustomValue:@(type) forKey:NSStringFromSelector(@selector(type))];
}

- (void)setStatus:(SAPActivityStatus)status {
    [self setCustomValue:@(status) forKey:NSStringFromSelector(@selector(status))];
}

- (void)awakeFromFetch {
    NSDate *currentDate = [NSDate date];
    if (self.status != 1 && [currentDate compare:self.date] == NSOrderedDescending) {
        self.status = 1;
    }
}

@end
