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
#import "UIAlertController+SAPExtensions.h"

#import "SAPModelView.h"

#import "SAPViewControllerMacro.h"

static NSInteger  const kSAPSectionsCount           = 3;
static CGFloat    const kSAPEstimatedRowHeight      = 66.0;
static NSString * const kSAPSection1Header          = @"Outdated";
static NSString * const kSAPSection2Header          = @"Actual";
static NSString * const kSAPSection3Header          = @"Completed";
static NSString * const kSAPEditActionTitle         = @"Edit";
static NSString * const kSAPCompleteActionTitle     = @"Complete";
static NSString * const kSAPDeleteActionTitle       = @"Delete";
static NSString * const kSAPAllertControllerTitle   = @"Select action";

SAPViewControllerBaseViewProperty(SAPActivitiesViewController, SAPActivitiesView, mainView);

@interface SAPActivitiesViewController ()
@property (nonatomic, readonly) UITableView *tableView;

- (Class)cellClass;
- (void)customizeRightBarButton;

- (SAPArrayModel *)modelForSectionAtIndexPath:(NSIndexPath*)indexPath;
- (SAPArrayModel *)modelForSection:(NSInteger)section;

- (UIAlertAction *)editActionWithActivity:(SAPActivity *)activity;
- (UIAlertAction *)completeActionWithActivity:(SAPActivity *)activity;
- (UIAlertAction *)deleteActionWithActivity:(SAPActivity *)activity;

@end

@implementation SAPActivitiesViewController

@dynamic tableView;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self customizeRightBarButton];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UITableView *)tableView {
    return self.mainView.tableView;
}

#pragma mark-
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = kSAPEstimatedRowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    #warning temporary code for testing
    SAPActivities *model = [SAPActivities new];
    
    for (int counter = 0; counter < 10; counter++) {
        SAPActivity *activity = [SAPActivity new];
        activity.note = [NSString stringWithFormat:@"outdatedddddddddddddddddddddddddddd dddddddddddddddd %d", counter];
        activity.date = [NSDate dateWithTimeIntervalSinceNow:-86400];
        [model addObject:activity];
        [activity addObserverObject:self];
    }
    
    for (int counter = 0; counter < 10; counter++) {
        SAPActivity *activity = [SAPActivity new];
        activity.note = [NSString stringWithFormat:@"actual %d", counter];
        activity.date = [NSDate dateWithTimeIntervalSinceNow:86400];
        [model addObject:activity];
        [activity addObserverObject:self];
    }
    
    for (int counter = 0; counter < 10; counter++) {
        SAPActivity *activity = [SAPActivity new];
        activity.note = [NSString stringWithFormat:@"completed %d", counter];
        activity.date = [NSDate date];
        activity.completed = @(1);
        [model addObject:activity];
        [activity addObserverObject:self];
    }
    
    self.model = model;
    
    ////
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SAPArrayModel *activities = [self modelForSectionAtIndexPath:indexPath];
    SAPActivity *activity = activities[indexPath.row];
 
    UIAlertAction *editAction = [self editActionWithActivity:activity];
    UIAlertAction *completeAction = [self completeActionWithActivity:activity];
    UIAlertAction *deleteAction = [self deleteActionWithActivity:activity];
    
    UIAlertController *controller = [UIAlertController actionSheetWithTitle:kSAPAllertControllerTitle
                                                                    message:nil
                                                                    actions:@[editAction, completeAction, deleteAction]];
    
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self modelForSection:section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAPTableViewCell<SAPModelView> *cell = [tableView cellWithClass:[self cellClass]];
    SAPArrayModel *activities = [self modelForSectionAtIndexPath:indexPath];
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

- (void)customizeRightBarButton {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddTask)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)onAddTask {
//    SAPActivityViewController *controller = [SAPActivityViewController new];
//    controller.model = [SAPActivity new];
//    [self.navigationController pushViewController:controller animated:NO];
}

- (SAPArrayModel *)modelForSectionAtIndexPath:(NSIndexPath*)indexPath {
    return [self modelForSection:indexPath.section];
}

- (NSArray *)modelForSection:(NSInteger)section {
    SAPActivities *model = self.model;
    
    switch (section) {
        case 0:
            return model.outdated;
            break;
            
        case 1:
            return model.actual;
            break;
            
        case 2:
            return model.completed;
            break;
            
        default:
            return nil;
            break;
    }
}

- (UIAlertAction *)editActionWithActivity:(SAPActivity *)activity {
    return [UIAlertAction actionWithTitle:kSAPEditActionTitle
                                    style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action) {
                                      //edit code
                                  }];
}

- (UIAlertAction *)completeActionWithActivity:(SAPActivity *)activity {
    return [UIAlertAction actionWithTitle:kSAPCompleteActionTitle
                                    style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action) {
                                      activity.completed = @(1);
                                      [activity notifyObserversWithSelector:@selector(modelDidFinishLoading:)
                                                                 withObject:activity];
                                  }];
}

- (UIAlertAction *)deleteActionWithActivity:(SAPActivity *)activity {
    return [UIAlertAction actionWithTitle:kSAPDeleteActionTitle
                                    style:UIAlertActionStyleDestructive
                                  handler:^(UIAlertAction *action) {
                                      //edit code
                                  }];
}

@end
