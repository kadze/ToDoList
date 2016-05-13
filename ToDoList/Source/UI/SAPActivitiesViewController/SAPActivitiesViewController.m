//
//  SAPActivitiesViewController.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "SAPActivitiesViewController.h"

#import "SAPActivity.h"
#import "SAPActivities.h"
#import "SAPActivityCell.h"
#import "SAPActivitiesview.h"
#import "SAPTableViewCell.h"

#import "UITableView+SAPExtensions.h"

#import "SAPModelView.h"

#import "SAPViewControllerMacro.h"

static NSInteger const kSAPSectionsCount = 3;
static NSString * const kSAPSection1Header = @"Outdated";
static NSString * const kSAPSection2Header = @"Actual";
static NSString * const kSAPSection3Header = @"Completed";

SAPViewControllerBaseViewProperty(SAPActivitiesViewController, SAPActivitiesView, mainView);

@interface SAPActivitiesViewController ()

- (Class)cellClass;
- (UITableView *)tableView;
- (void)customizeRightBarButton;

@end

@implementation SAPActivitiesViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self customizeRightBarButton];
    
    return self;
}

#warning temporary code for testing

- (void)viewDidLoad {
    SAPActivities *model = [SAPActivities new];
    
    for (int counter = 0; counter < 10; counter++) {
        SAPActivity *activity = [SAPActivity new];
        activity.note = [NSString stringWithFormat:@"outdated %d", counter];
        activity.date = [NSDate date];
        [model addOutdated:activity];
    }
    
    for (int counter = 0; counter < 10; counter++) {
        SAPActivity *activity = [SAPActivity new];
        activity.note = [NSString stringWithFormat:@"actual %d", counter];
        activity.date = [NSDate date];
        [model addActual:activity];
    }
    
    for (int counter = 0; counter < 10; counter++) {
        SAPActivity *activity = [SAPActivity new];
        activity.note = [NSString stringWithFormat:@"completed %d", counter];
        activity.date = [NSDate date];
        [model addCompleted:activity];
    }
    
    self.model = model;
}

////

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
#pragma mark Public

- (void)updateViewControllerWithModel:(id)model {
    [self.tableView reloadData];
}

#warning temporary testing code
- (void)finishModelSetting {
    [self.model notifyObserversWithSelector:@selector(modelDidFinishLoading:) withObject:self.model];
}

#pragma mark -
#pragma mark Private

- (Class)cellClass {
    return [SAPActivityCell class];
}

- (UITableView *)tableView {
    return self.mainView.tableView;
}

- (void)customizeRightBarButton {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddTask)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)onAddTask {
//    SAPActivityViewController *controller = [SAPActivityViewController new];
//    controller.model = [SAPActivity new];
//    [self.navigationController pushViewController:controller animated:NO];
}


@end
