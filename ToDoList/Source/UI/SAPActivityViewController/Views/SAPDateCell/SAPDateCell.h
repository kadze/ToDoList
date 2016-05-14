//
//  SAPDateCell.h
//  ToDoList
//
//  Created by Andrey on 5/14/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTableViewCell.h"
#import "SAPModelView.h"

@class UIDatePicker;

@interface SAPDateCell : SAPTableViewCell <SAPModelView>
@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;

@end
