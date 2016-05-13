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
#import "SAPActivityCell.h"
#import "SAPTableViewCell.h"

#import "UITableView+SAPExtensions.h"

#import "SAPModelView.h"

static NSInteger const kSAPSectionsCount = 3;
static NSString * const kSAPSection1Header = @"Outdated";
static NSString * const kSAPSection2Header = @"Actual";
static NSString * const kSAPSection3Header = @"Completed";

@interface SAPActivitiesViewController ()

- (Class)cellClass;

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
    SAPTableViewCell<SAPModelView> *cell = [tableView cellWithClass:[self cellClass]];
    NSInteger section = indexPath.section;
    SAPArrayModel *activities = nil;
    SAPActivities *model = self.model;
    switch (section) {
        case 0:
            activities = model.outdated;
            break;
            
        case 1:
            activities = model.actual;
            break;
            
        case 2:
            activities = model.completed;
            break;
            
        default:
            activities = nil;
            break;
    }
    
    cell.model = activities[indexPath.row];
    
    return cell;
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

#pragma mark -
#pragma mark Private

- (Class)cellClass {
    return [SAPActivityCell class];
}

@end
