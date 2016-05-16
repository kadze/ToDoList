//
//  SAPActivity.m
//  ToDoList
//
//  Created by Andrey on 5/12/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "SAPActivity.h"

#import "SAPBundleImageModel.h"

#import "NSManagedObject+SAPExtensions.h"

static NSString * const kSAPCallImageFilename    = @"call";
static NSString * const kSAPMeetingImageFilename = @"meeting";
static NSString * const kSAPTaskImageFilename    = @"task";

@implementation SAPActivity

@dynamic type;
@dynamic status;
@dynamic note;
@dynamic date;

@dynamic imageModel;

#pragma mark -
#pragma mark Accessors

- (void)setType:(SAPActivityType)type {
    [self setCustomValue:@(type) forKey:NSStringFromSelector(@selector(type))];
}

- (void)setStatus:(SAPActivityStatus)status {
    [self setCustomValue:@(status) forKey:NSStringFromSelector(@selector(status))];
}

- (void)awakeFromFetch {
    NSDate *currentDate = [NSDate date];
    if (self.status != 2 && [currentDate compare:self.date] == NSOrderedDescending) {
        self.status = 1;
    }
}

- (SAPBundleImageModel *)imageModel {
    NSString *filename = nil;
    SAPActivityType type = self.type;
    
    switch (type) {
        case kSAPActivityTypeCall:
            filename = kSAPCallImageFilename;
            break;
        
        case kSAPActivityTypeTask:
            filename = kSAPTaskImageFilename;
            break;
            
        case kSAPActivityTypeMeeting:
            filename = kSAPMeetingImageFilename;
            break;
            
        default:
            break;
    }
    
    return [SAPBundleImageModel imageWithUrl:[NSURL URLWithString:filename]];
}

@end
