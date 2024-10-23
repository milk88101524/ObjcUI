//
//  ObjcSizedBox.m
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#import "ObjcSizedBox.h" // 引入 ObjcSizedBox 的頭文件

@implementation ObjcSizedBox // 開始 ObjcSizedBox 類的實現

// 類方法：創建帶有子視圖的 ObjcSizedBox
+ (instancetype)sizedBoxWithChild:(UIView *)child {
    ObjcSizedBox *sizedBox = [[self alloc] init]; // 初始化 ObjcSizedBox 實例
    sizedBox.childView = child; // 設置子視圖
    
    if (child) { // 如果子視圖不為 nil
        [sizedBox addSubview:child]; // 將子視圖添加到 ObjcSizedBox
        child.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動轉換約束
        [NSLayoutConstraint activateConstraints:@[
            [child.topAnchor constraintEqualToAnchor:sizedBox.topAnchor], // 設置子視圖的上邊距
            [child.bottomAnchor constraintEqualToAnchor:sizedBox.bottomAnchor], // 設置子視圖的下邊距
            [child.leadingAnchor constraintEqualToAnchor:sizedBox.leadingAnchor], // 設置子視圖的左邊距
            [child.trailingAnchor constraintEqualToAnchor:sizedBox.trailingAnchor] // 設置子視圖的右邊距
        ]];
    }
    
    return sizedBox; // 返回創建的 ObjcSizedBox 實例
}

// 類方法：創建指定寬度的 ObjcSizedBox
+ (instancetype)sizedBoxWithWidth:(CGFloat)width {
    ObjcSizedBox *sizedBox = [[self alloc] init]; // 初始化 ObjcSizedBox 實例
    sizedBox.width = width; // 設置寬度

    if (width > 0) { // 如果寬度大於零
        [sizedBox.widthAnchor constraintEqualToConstant:width].active = YES; // 設置寬度約束
    }
    
    return sizedBox; // 返回創建的 ObjcSizedBox 實例
}

// 類方法：創建指定高度的 ObjcSizedBox
+ (instancetype)sizedBoxWithHeight:(CGFloat)height {
    ObjcSizedBox *sizedBox = [[self alloc] init]; // 初始化 ObjcSizedBox 實例
    sizedBox.height = height; // 設置高度

    if (height > 0) { // 如果高度大於零
        [sizedBox.heightAnchor constraintEqualToConstant:height].active = YES; // 設置高度約束
    }

    return sizedBox; // 返回創建的 ObjcSizedBox 實例
}

// 類方法：創建指定寬度和高度的 ObjcSizedBox，並且包含子視圖
+ (instancetype)sizedBoxWithWidth:(CGFloat)width height:(CGFloat)height child:(UIView *)child {
    ObjcSizedBox *sizedBox = [[self alloc] init]; // 初始化 ObjcSizedBox 實例
    sizedBox.width = width; // 設置寬度
    sizedBox.height = height; // 設置高度
    sizedBox.childView = child; // 設置子視圖

    if (child) { // 如果子視圖不為 nil
        [sizedBox addSubview:child]; // 將子視圖添加到 ObjcSizedBox
        child.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動轉換約束
        [NSLayoutConstraint activateConstraints:@[
            [child.topAnchor constraintEqualToAnchor:sizedBox.topAnchor], // 設置子視圖的上邊距
            [child.bottomAnchor constraintEqualToAnchor:sizedBox.bottomAnchor], // 設置子視圖的下邊距
            [child.leadingAnchor constraintEqualToAnchor:sizedBox.leadingAnchor], // 設置子視圖的左邊距
            [child.trailingAnchor constraintEqualToAnchor:sizedBox.trailingAnchor] // 設置子視圖的右邊距
        ]];
    }

    if (width > 0) { // 如果寬度大於零
        [sizedBox.widthAnchor constraintEqualToConstant:width].active = YES; // 設置寬度約束
    }
    if (height > 0) { // 如果高度大於零
        [sizedBox.heightAnchor constraintEqualToConstant:height].active = YES; // 設置高度約束
    }

    return sizedBox; // 返回創建的 ObjcSizedBox 實例
}

@end
