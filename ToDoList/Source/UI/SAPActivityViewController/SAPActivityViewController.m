//
//  SAPActivityViewController.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPActivityViewController.h"

#import "SAPActivity.h"
#import "SAPActivityView.h"
#import "SAPTableViewCell.h"
#import "SAPTypeCell.h"
#import "SAPDateCell.h"
#import "SAPNoteCell.h"

#import "UITableView+SAPExtensions.h"

#import "SAPViewControllerMacro.h"

static NSInteger const kSAPRowsCount            = 3;
static CGFloat   const kSAPEstimatedRowHeight   = 44.0;

SAPViewControllerBaseViewProperty(SAPActivityViewController, SAPActivityView, mainView);

@interface SAPActivityViewController ()
@property (nonatomic, readonly) UITableView *tableView;

- (void)customizeNavigationBar;
- (Class)cellClassForRow:(NSInteger)row;

@end

@implementation SAPActivityViewController

@dynamic tableView;

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

#pragma mark-
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = kSAPEstimatedRowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kSAPRowsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = [self cellClassForRow:indexPath.row];
    SAPTableViewCell<SAPModelView> *cell = [tableView cellWithClass:cellClass];
    cell.model = self.model;
    
    return cell;
}

#pragma mark -
#pragma mark Private

- (void)customizeNavigationBar {
    
}

- (Class)cellClassForRow:(NSInteger)row {
    switch (row) {
        case 0:
            return [SAPTypeCell class];
            break;
            
        case 1:
            return [SAPNoteCell class];
            break;
            
        case 2:
            return [SAPDateCell class];
            break;
            
        default:
            return Nil;
            break;
    }
}

@end
