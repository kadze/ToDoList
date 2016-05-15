//
//  SAPActivity.h
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <CoreData/CoreData.h>

@class SAPBundleImageModel;

typedef NS_ENUM(uint16_t, SAPActivityType) {
    kSAPActivityTypeCall,
    kSAPActivityTypeMeeting,
    kSAPActivityTypeTask
};

typedef NS_ENUM(uint16_t, SAPActivityStatus) {
    kSAPActivityStatusActual,
    kSAPActivityStatusOutdated,
    kSAPActivityStatusCompleted
};

@interface SAPActivity : NSManagedObject
@property (nonatomic, assign)   SAPActivityType     type;
@property (nonatomic, assign)   SAPActivityStatus   status;
@property (nonatomic, strong)   NSString            *note;
@property (nonatomic, strong)   NSDate              *date;

@property (nonatomic, readonly) SAPBundleImageModel       *imageModel;

@end