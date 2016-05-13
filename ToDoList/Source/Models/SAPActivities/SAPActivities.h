//
//  SAPActivities.h
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import "SAPModel.h"

#import "SAPArrayModel.h"

@class SAPActivity;

@interface SAPActivities : SAPModel
@property (nonatomic, strong) SAPArrayModel *outdated;
@property (nonatomic, strong) SAPArrayModel *actual;
@property (nonatomic, strong) SAPArrayModel *completed;

- (void)addOutdated:(SAPActivity *)activity;
- (void)addActual:(SAPActivity *)activity;
- (void)addCompleted:(SAPActivity *)activity;

@end
