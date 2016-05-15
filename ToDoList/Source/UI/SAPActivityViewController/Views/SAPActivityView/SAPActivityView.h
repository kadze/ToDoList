//
//  SAPActivityView.h
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//
#import <UIKit/UITableView.h>

#import "SAPView.h"

#import "SAPModelView.h"

@interface SAPActivityView : SAPView
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
