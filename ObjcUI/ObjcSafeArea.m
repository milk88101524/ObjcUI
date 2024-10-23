//
//  ObjcSafeArea.m
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#import "ObjcSafeArea.h"

@implementation ObjcSafeArea

+ (instancetype)safeAreaWithView:(UIView *)view inSuperview:(UIView *)superview {
    // 創建 ObjcSafeArea 實例
    ObjcSafeArea *safeArea = [[self alloc] init];
    safeArea.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動轉換 AutoresizingMask 的約束，允許使用 Auto Layout
    [superview addSubview:safeArea]; // 將 safeArea 視圖添加到父視圖中

    // 使用 Auto Layout 設定 Safe Area 的四邊與 superview 的 safeAreaLayoutGuide 對齊
    [NSLayoutConstraint activateConstraints:@[
        [safeArea.topAnchor constraintEqualToAnchor:superview.safeAreaLayoutGuide.topAnchor],        // Safe Area 頂部對齊
        [safeArea.bottomAnchor constraintEqualToAnchor:superview.safeAreaLayoutGuide.bottomAnchor],  // Safe Area 底部對齊
        [safeArea.leadingAnchor constraintEqualToAnchor:superview.safeAreaLayoutGuide.leadingAnchor],// Safe Area 左邊對齊
        [safeArea.trailingAnchor constraintEqualToAnchor:superview.safeAreaLayoutGuide.trailingAnchor]// Safe Area 右邊對齊
    ]];
    
    // 將傳入的子視圖添加到 safeArea 中
    [safeArea addSubview:view];

    return safeArea; // 返回安全區域的實例
}

@end
