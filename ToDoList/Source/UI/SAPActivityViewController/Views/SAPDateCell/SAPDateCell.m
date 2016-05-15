//
//  SAPDateCell.m
//  ToDoList
//
//  Created by Andrey on 5/14/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UIDatePicker.h>

#import "SAPDateCell.h"

#import "SAPActivity.h"

@implementation SAPDateCell

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(id)model {
    if (_model != model) {
        _model = model;
        
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark SAPModelView

- (void)fillWithModel:(SAPActivity *)model {
    NSDate *date = model.date;
    if (date) {
        self.datePicker.date = date;
    }
}

#pragma mark -
#pragma mark Public

- (void)fillModelFromView {
    SAPActivity *model = self.model;
    model.date = self.datePicker.date;
}

@end
