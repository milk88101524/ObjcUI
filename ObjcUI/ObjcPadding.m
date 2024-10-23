//
//  ObjcPadding.m
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#import "ObjcPadding.h"

@implementation ObjcPadding

// 創建一個具內邊距的 ObjcPadding 並包含指定的子視圖
+ (instancetype)paddingWithInsets:(UIEdgeInsets)insets view:(UIView *)view {
    ObjcPadding *paddingView = [[self alloc] init];
    paddingView.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動佈局，將使用自定義的佈局約束
    
    // 將子視圖添加到 paddingView 中
    [paddingView addSubview:view];
    
    // 禁用子視圖的自動佈局
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 設置內邊距的約束，這些約束確保子視圖與 paddingView 的邊緣之間有指定的間距
    [NSLayoutConstraint activateConstraints:@[
        [view.topAnchor constraintEqualToAnchor:paddingView.topAnchor constant:insets.top],       // 上方內邊距
        [view.bottomAnchor constraintEqualToAnchor:paddingView.bottomAnchor constant:-insets.bottom], // 下方內邊距
        [view.leadingAnchor constraintEqualToAnchor:paddingView.leadingAnchor constant:insets.left],  // 左側內邊距
        [view.trailingAnchor constraintEqualToAnchor:paddingView.trailingAnchor constant:-insets.right] // 右側內邊距
    ]];
    
    return paddingView; // 返回包含內邊距的視圖
}

// 創建具內邊距的 ObjcPadding，並將其加入到指定的父視圖中
+ (instancetype)viewPaddingWithInsets:(UIEdgeInsets)insets view:(UIView *)view inSuperview:(UIView *)superview {
    ObjcPadding *paddingView = [[self alloc] init];
    paddingView.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動佈局
    
    // 將子視圖添加到 paddingView 中
    [paddingView addSubview:view];
    
    // 禁用子視圖的自動佈局
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 將 paddingView 添加到父視圖中
    [superview addSubview:paddingView];
    
    // 設置子視圖的內邊距約束，與上面的邏輯相同，控制子視圖與 paddingView 邊緣的距離
    [NSLayoutConstraint activateConstraints:@[
        [view.topAnchor constraintEqualToAnchor:paddingView.topAnchor constant:insets.top],        // 上方內邊距
        [view.bottomAnchor constraintEqualToAnchor:paddingView.bottomAnchor constant:-insets.bottom],  // 下方內邊距
        [view.leadingAnchor constraintEqualToAnchor:paddingView.leadingAnchor constant:insets.left],   // 左側內邊距
        [view.trailingAnchor constraintEqualToAnchor:paddingView.trailingAnchor constant:-insets.right] // 右側內邊距
    ]];
    
    // 設置 paddingView 本身的寬度約束，使其適應 superview 的寬度
    [NSLayoutConstraint activateConstraints:@[
        [paddingView.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor], // paddingView 左邊對齊父視圖
        [paddingView.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor] // paddingView 右邊對齊父視圖
    ]];
    
    return paddingView; // 返回設置好的 paddingView
}

@end
