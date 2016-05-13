//
//  UIAlertController+SAPExtensions.h
//  ToDoList
//
//  Created by Andrey on 5/13/16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (SAPExtensions)

+ (instancetype)actionSheetWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions;
+ (instancetype)alertWithError:(NSError *)error;
+ (void)showWithError:(NSError *)error viewController:(UIViewController *)controller;

@end
