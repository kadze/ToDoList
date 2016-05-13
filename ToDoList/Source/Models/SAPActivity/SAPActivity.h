//
//  SAPActivity.h
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <CoreData/CoreData.h>

typedef NS_ENUM(NSUInteger, SAPActivityType) {
    kSAPActivityTypeCall,
    kSAPActivityTypeMeeting,
    kSAPActivityTypeTask
};

#warning temporary testing code
//@interface SAPActivity : NSManagedObject
@interface SAPActivity : NSObject
@property (nonatomic, assign) SAPActivityType   type;
@property (nonatomic, strong) NSNumber          *completed;
@property (nonatomic, strong) NSString          *note;
@property (nonatomic, strong) NSDate            *date;

@end