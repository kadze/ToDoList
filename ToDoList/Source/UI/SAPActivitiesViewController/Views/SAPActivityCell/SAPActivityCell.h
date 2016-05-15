//
//  SAPActivityCell.h
//  ToDoList
//
//  Created by Andrey on 5/13/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPTableViewCell.h"

#import "SAPModelView.h"

@class SAPImageView;

@interface SAPActivityCell : SAPTableViewCell <SAPModelView>
@property (nonatomic, strong) IBOutlet UILabel      *noteLabel;
@property (nonatomic, strong) IBOutlet UILabel      *dateLabel;
@property (nonatomic, strong) IBOutlet SAPImageView *typeView;

@end
