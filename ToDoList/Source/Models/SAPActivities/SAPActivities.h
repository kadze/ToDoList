//
//  SAPActivities.h
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import "SAPArrayModel.h"

@class SAPActivity;

@interface SAPActivities : SAPArrayModel
@property (nonatomic, readonly) NSArray *outdated;
@property (nonatomic, readonly) NSArray *actual;
@property (nonatomic, readonly) NSArray *completed;

@end
