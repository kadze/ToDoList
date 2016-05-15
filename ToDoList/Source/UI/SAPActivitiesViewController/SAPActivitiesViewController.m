//
//  SAPActivitiesViewController.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MagicalRecord/MagicalRecord.h>

#import "SAPActivitiesViewController.h"

#import "SAPActivity.h"
#import "SAPActivities.h"
#import "SAPActivityCell.h"
#import "SAPActivitiesview.h"
#import "SAPTableViewCell.h"
#import "SAPActivityViewController.h"

#import "UITableView+SAPExtensions.h"
#import "UIAlertController+SAPExtensions.h"

#import "SAPModelView.h"

#import "SAPViewControllerMacro.h"

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

//- (Class)cellClass;
- (void)customizeRightBarButton;
- (void)onAddTask;
- (void)showActivityViewControllerWithModel:(SAPActivity *)model;

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
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SAPActivity *activity = [self.fetchedResultsController objectAtIndexPath:indexPath];
 
    UIAlertAction *editAction = [self editActionWithActivity:activity];
    UIAlertAction *completeAction = [self completeActionWithActivity:activity];
    UIAlertAction *deleteAction = [self deleteActionWithActivity:activity];
    
    UIAlertController *controller = [UIAlertController actionSheetWithTitle:kSAPAllertControllerTitle
                                                                    message:nil
                                                                    actions:@[editAction, completeAction, deleteAction]];
    
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark -
#pragma mark Public

- (void)updateViewControllerWithModel:(id)model {

}

- (Class)cellClass {
    return [SAPActivityCell class];
}

- (void)finishModelSetting {

}

- (Class)entityClass {
    return [SAPActivity class];
}

- (NSString *)sectionNameKeyPath {
    return @"section";
}

- (NSArray *)sortDescriptors {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"completed"
                                                                   ascending:YES];

    return @[sortDescriptor];
}


#pragma mark -
#pragma mark Private

- (void)customizeRightBarButton {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddTask)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)onAddTask {
    [self showActivityViewControllerWithModel:[SAPActivity MR_createEntity]];
}

- (void)showActivityViewControllerWithModel:(SAPActivity *)model {
    SAPActivityViewController *controller = [SAPActivityViewController new];
    controller.model = model;
    [self.navigationController pushViewController:controller animated:NO];
}

- (UIAlertAction *)editActionWithActivity:(SAPActivity *)activity {
    return [UIAlertAction actionWithTitle:kSAPEditActionTitle
                                    style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action) {
                                      [self showActivityViewControllerWithModel:activity];
                                  }];
}

- (UIAlertAction *)completeActionWithActivity:(SAPActivity *)activity {
    return [UIAlertAction actionWithTitle:kSAPCompleteActionTitle
                                    style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action) {
                                      activity.completed = @(1);
                                  }];
}

- (UIAlertAction *)deleteActionWithActivity:(SAPActivity *)activity {
    return [UIAlertAction actionWithTitle:kSAPDeleteActionTitle
                                    style:UIAlertActionStyleDestructive
                                  handler:^(UIAlertAction *action) {
                                      [activity MR_deleteEntity];
                                  }];
}

@end
