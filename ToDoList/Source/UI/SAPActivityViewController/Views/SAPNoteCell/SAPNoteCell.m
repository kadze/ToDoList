//
//  SAPNoteCell.m
//  ToDoList
//
//  Created by Andrey on 5/14/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UITextView.h>

#import "SAPNoteCell.h"

#import "SAPActivity.h"

@implementation SAPNoteCell

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
    if (model) {
        self.textView.text = model.note;
    }
}

#pragma mark -
#pragma mark Public

- (void)fillModelFromView {
    SAPActivity *model = self.model;
    model.note = self.textView.text;
}

@end
