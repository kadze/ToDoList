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
    self.datePicker.date = model.date;
}

@end
