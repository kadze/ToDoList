//
//  SAPActivities.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPActivities.h"

@implementation SAPActivities

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.outdated = [SAPArrayModel new];
        self.actual = [SAPArrayModel new];
        self.completed = [SAPArrayModel new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addOutdated:(SAPActivity *)activity {
    [self.outdated addObject:activity];
}

- (void)addActual:(SAPActivity *)activity {
    [self.actual addObject:activity];
}

- (void)addCompleted:(SAPActivity *)activity {
    [self.completed addObject:activity];
}

@end
