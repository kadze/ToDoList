//
//  SAPNoteCell.h
//  ToDoList
//
//  Created by Andrey on 5/14/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTableViewCell.h"
#import "SAPModelView.h"

@class UITextView;

@interface SAPNoteCell : SAPTableViewCell <SAPModelView>
@property (nonatomic, strong) IBOutlet UITextView *textView;

- (void)fillModel:(id)model;

@end
