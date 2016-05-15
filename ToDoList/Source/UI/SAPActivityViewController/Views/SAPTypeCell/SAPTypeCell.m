//
//  SAPTypeCell.m
//  ToDoList
//
//  Created by Andrey on 5/14/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UISegmentedControl.h>

#import "SAPTypeCell.h"

#import "SAPActivity.h"

@implementation SAPTypeCell

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
    self.segmentedControl.selectedSegmentIndex = model.type;
}

#pragma mark -
#pragma mark Public

- (void)fillModelFromView {
    SAPActivity *model = self.model;
    model.type = self.segmentedControl.selectedSegmentIndex;
}

@end
