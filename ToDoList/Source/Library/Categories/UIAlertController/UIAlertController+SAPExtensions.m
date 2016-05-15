//
//  UIAlertController+SAPExtensions.m
//  ToDoList
//
//  Created by Andrey on 5/13/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UIAlertController+SAPExtensions.h"

static NSString * const kSAPOKTitle     = @"OK";
static NSString * const kSAPErrorTitle  = @"Error!";

@implementation UIAlertController (SAPExtensions)

#pragma mark -
#pragma mark Class methods

+ (instancetype)actionSheetWithTitle:(NSString *)title
                             message:(NSString *)message
                             actions:(NSArray *)actions
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (UIAlertAction *action in actions) {
        [controller addAction:action];
    }
    
    return controller;
}

+ (instancetype)alertWithError:(NSError *)error {
    UIAlertController *alert = [self alertControllerWithTitle:kSAPErrorTitle
                                                      message:[error localizedDescription]
                                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:kSAPOKTitle style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    return alert;
}

+ (void)showWithError:(NSError *)error viewController:(UIViewController *)controller {
    [controller presentViewController:[self alertWithError:error] animated:YES completion:nil];
}

@end
