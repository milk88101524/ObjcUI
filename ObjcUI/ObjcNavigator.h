//
//  ObjcNavigator.h
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#ifndef ObjcNavigator_h
#define ObjcNavigator_h

#import <UIKit/UIKit.h>

@interface ObjcNavigator : NSObject

+ (void)pushViewController:(UIViewController *)viewController from:(UIViewController *)currentViewController;
+ (void)popViewControllerFrom:(UIViewController *)currentViewController;

@end

#endif /* ObjcNavigator_h */
