//
//  SAPActivities.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPActivities.h"

#import "SAPActivity.h"

@implementation SAPActivities

@dynamic outdated, actual, completed;

#pragma mark -
#pragma mark Accessors

//- (NSArray *)outdated {
//    NSMutableArray *outdated = [NSMutableArray new];
//    NSDate *currentDate = [NSDate date];
//    for (SAPActivity *activity in self.objects) {
//        if (!activity.completed &&
//            [currentDate compare:activity.date] == NSOrderedDescending) {
//            [outdated addObject:activity];
//        }
//    }
//    
//    return [outdated copy];
//}
//
//- (NSArray *)actual {
//    NSMutableArray *actual = [NSMutableArray new];
//    NSDate *currentDate = [NSDate date];
//    for (SAPActivity *activity in self.objects) {
//        if (!activity.completed &&
//            [currentDate compare:activity.date] != NSOrderedDescending) {
//            [actual addObject:activity];
//        }
//    }
//    
//    return [actual copy];
//}
//
//- (NSArray *)completed {
//    NSMutableArray *completed = [NSMutableArray new];
//    for (SAPActivity *activity in self.objects) {
//        if (activity.completed) {
//            [completed addObject:activity];
//        }
//    }
//    
//    return [completed copy];
//}

@end
