//
//  SAPActivityViewController.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UIBarButtonItem.h>
#import <UIKit/UINavigationController.h>
#import <UIKit/UINavigationBar.h>
#import <UIKit/UIToolbar.h>
#import <MagicalRecord/MagicalRecord.h>

#import "SAPActivityViewController.h"

#import "SAPActivity.h"
#import "SAPActivityView.h"
#import "SAPTableViewCell.h"
#import "SAPTypeCell.h"
#import "SAPDateCell.h"
#import "SAPNoteCell.h"

#import "UITableView+SAPExtensions.h"

#import "SAPModelView.h"

#import "SAPViewControllerMacro.h"
#import "SAPOwnershipMacro.h"

static NSInteger const kSAPRowsCount            = 3;
static CGFloat   const kSAPEstimatedRowHeight   = 44.0;

SAPViewControllerBaseViewProperty(SAPActivityViewController, SAPActivityView, mainView);

@interface SAPActivityViewController ()
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, strong)   NSArray     *cells;

- (void)onCancelButton;
- (void)onSaveButton;

- (void)customizeNavigationBar;

@end

@implementation SAPActivityViewController

@dynamic tableView;

@synthesize model = _model;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self customizeNavigationBar];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UITableView *)tableView {
    return self.mainView.tableView;
}

- (NSArray *)cells {
    if (_cells) {
        return _cells;
    }
    
    UITableView *tableView = self.tableView;
    if (!tableView) {
        return nil;
    }
    
    SAPTypeCell *typeCell = [tableView cellWithClass:[SAPTypeCell class]];
    SAPNoteCell *noteCell = [tableView cellWithClass:[SAPNoteCell class]];
    SAPDateCell *dateCell = [tableView cellWithClass:[SAPDateCell class]];
    
    _cells = @[typeCell, noteCell, dateCell];
    SAPActivity *model = self.model;
    
    for (id<SAPModelView> cell in _cells) {
        cell.model = model;
    }
    
    return _cells;
}

#pragma mark-
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = kSAPEstimatedRowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark -
#pragma mark Interface Handling

- (void)onCancelButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onSaveButton {
    SAPActivity *model = self.model;
    for (id cell in self.cells) {
        [cell fillModel:model];
    }
    
    NSDate *currentDate = [NSDate date];
    if (model.status != 2 && [currentDate compare:model.date] == NSOrderedDescending) {
        model.status = 1;
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kSAPRowsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    return self.cells[row];
}

#pragma mark -
#pragma mark Private

- (void)customizeNavigationBar {
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                target:self
                                                                                action:@selector(onSaveButton)];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(onCancelButton)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
}

@end
