//
//  SAPActivity.h
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "SAPModel.h"
#import "SAPManagedObject.h"

#import "SAPModelProtocol.h"

typedef NS_ENUM(uint16_t, SAPActivityType) {
    kSAPActivityTypeCall,
    kSAPActivityTypeMeeting,
    kSAPActivityTypeTask
};

@interface SAPActivity : SAPManagedObject<SAPModelProtocol>
@property (nonatomic, assign)   SAPActivityType type;
@property (nonatomic, strong)   NSNumber        *completed;
@property (nonatomic, strong)   NSString        *note;
@property (nonatomic, strong)   NSDate          *date;
@property (nonatomic, readonly) NSString        *section;

@end