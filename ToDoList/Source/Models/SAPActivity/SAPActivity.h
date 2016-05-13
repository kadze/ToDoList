//
//  SAPActivity.h
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#warning temporary testing code
@interface SAPActivity :NSObject//: NSManagedObject
@property (nonatomic, strong) NSString  *note;
@property (nonatomic, strong) NSDate    *date;
@property (nonatomic, strong) NSNumber  *type;

@end