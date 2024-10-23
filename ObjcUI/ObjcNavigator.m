//
//  ObjcNavigator.m
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#import "ObjcNavigator.h" // 引入 ObjcNavigator 的頭文件

@implementation ObjcNavigator // 開始實現 ObjcNavigator 類

// 類方法：推送新的視圖控制器
+ (void)pushViewController:(UIViewController *)viewController from:(UIViewController *)currentViewController {
    // 使用當前視圖控制器的導航控制器推送新的視圖控制器
    [currentViewController.navigationController pushViewController:viewController animated:YES];
}

// 類方法：彈出當前視圖控制器
+ (void)popViewControllerFrom:(UIViewController *)currentViewController {
    // 使用當前視圖控制器的導航控制器彈出視圖控制器
    [currentViewController.navigationController popViewControllerAnimated:YES];
}

@end // 結束 ObjcNavigator 類的實現
