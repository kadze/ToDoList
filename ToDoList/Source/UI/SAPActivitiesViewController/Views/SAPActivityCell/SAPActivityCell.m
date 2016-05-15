//
//  SAPActivityCell.m
//  ToDoList
//
//  Created by Andrey on 5/13/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UILabel.h>

#import "SAPActivityCell.h"

#import "SAPActivity.h"

@implementation SAPActivityCell

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
    self.noteLabel.text = model.note;
    self.dateLabel.text = model.date.description;
}

@end
