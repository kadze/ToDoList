//
//  SAPActivitiesViewController.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UITableView.h>

#import "SAPActivitiesViewController.h"

#import "SAPActivities.h"

static NSInteger const kSAPSectionsCount = 3;
static NSString * const kSAPSection1Header = @"Outdated";
static NSString * const kSAPSection2Header = @"Actual";
static NSString * const kSAPSection3Header = @"Completed";

@interface SAPActivitiesViewController ()

@end

@implementation SAPActivitiesViewController

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SAPActivities *model = self.model;
    switch (section) {
        case 0:
            return model.outdated.count;
            break;
        
        case 1:
            return model.actual.count;
            break;
            
        case 2:
            return model.completed.count;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kSAPSectionsCount;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return kSAPSection1Header;
            break;
            
        case 1:
            return kSAPSection2Header;
            break;
            
        case 2:
            return kSAPSection3Header;
            break;
            
        default:
            return nil;
            break;
    }
}


@end
