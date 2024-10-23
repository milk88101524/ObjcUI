//
//  ObjcButton.m
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#import "ObjcButton.h"
#import <objc/runtime.h>

@implementation ObjcButton

// 類方法：創建帶有標籤的 ObjcButton 實例並添加到指定的父視圖中
+ (instancetype)buttonWithLabel:(UIView *)label inSuperview:(UIView *)superview {
    ObjcButton *button = [ObjcButton buttonWithType:UIButtonTypeSystem]; // 創建一個系統類型的 UIButton
    button.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動約束，使用自定義約束
    button.layer.cornerRadius = 14; // 設置圓角半徑
    button.backgroundColor = UIColor.systemBlueColor; // 設置按鈕背景顏色為系統藍色
    button.layer.shadowColor = [UIColor blackColor].CGColor; // 設置陰影顏色為黑色
    button.layer.shadowOpacity = 0.3; // 設置陰影不透明度
    button.layer.shadowOffset = CGSizeMake(0, 4); // 設置陰影偏移量
    button.layer.shadowRadius = 6; // 設置陰影半徑
    button.layer.masksToBounds = NO; // 允許陰影超出按鈕邊界
    
    label.tintColor = UIColor.whiteColor; // 設置標籤的顏色為白色
    
    // 如果標籤是 UILabel 類型，則設置其屬性
    if ([label isKindOfClass:[UILabel class]]) {
        UILabel *textLabel = (UILabel *)label; // 強制轉換為 UILabel
        textLabel.textColor = [UIColor whiteColor]; // 設置文本顏色為白色
        textLabel.textAlignment = NSTextAlignmentCenter; // 設置文本對齊方式為居中
    }
    
    [button addSubview:label]; // 將標籤添加到按鈕中
    label.translatesAutoresizingMaskIntoConstraints = NO; // 禁用標籤的自動約束
    
    // 設置標籤的約束條件
    [NSLayoutConstraint activateConstraints:@[
        [label.centerXAnchor constraintEqualToAnchor:button.centerXAnchor], // 水平居中
        [label.centerYAnchor constraintEqualToAnchor:button.centerYAnchor], // 垂直居中
        [label.leadingAnchor constraintEqualToAnchor:button.leadingAnchor constant:16], // 左邊距
        [label.trailingAnchor constraintEqualToAnchor:button.trailingAnchor constant:-16], // 右邊距
        [label.topAnchor constraintEqualToAnchor:button.topAnchor constant:16], // 上邊距
        [label.bottomAnchor constraintEqualToAnchor:button.bottomAnchor constant:-16] // 下邊距
    ]];
    
    [superview addSubview:button]; // 將按鈕添加到父視圖中
    
    return button; // 返回創建的 ObjcButton 實例
}

// 設置按鈕點擊事件的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(void(^)(void)))setOnTap {
    return ^ObjcButton *(void (^action)(void)) {
        [self addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside]; // 添加點擊事件監聽
        objc_setAssociatedObject(self, @selector(buttonTapped), action, OBJC_ASSOCIATION_COPY_NONATOMIC); // 以關聯對象的方式儲存動作
        return self; // 返回自身以便鏈式調用
    };
}

// 點擊事件的具體處理方法
- (void)buttonTapped {
    void (^action)(void) = objc_getAssociatedObject(self, @selector(buttonTapped)); // 獲取關聯的動作
    if (action) {
        [self defaultTapEffect]; // 調用默認的點擊效果
        action(); // 執行動作
    }
}

// 設置按鈕背景顏色的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(UIColor *color))setBackgroundColor {
    return ^ObjcButton *(UIColor *color) {
        self.backgroundColor = color; // 設置背景顏色
        return self; // 返回自身以便鏈式調用
    };
}

// 設置按鈕邊框的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(UIColor *color, CGFloat width))setBorder {
    return ^ObjcButton *(UIColor *color, CGFloat width) {
        self.layer.borderColor = color.CGColor; // 設置邊框顏色
        self.layer.borderWidth = width; // 設置邊框寬度
        return self; // 返回自身以便鏈式調用
    };
}

// 設置按鈕圓角半徑的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(CGFloat radius))setCornerRadius {
    return ^ObjcButton *(CGFloat radius) {
        self.layer.cornerRadius = radius; // 設置圓角半徑
        self.clipsToBounds = YES; // 設置剪裁邊界
        return self; // 返回自身以便鏈式調用
    };
}

// 默認點擊效果的實現
- (void)defaultTapEffect {
    UIColor *originalColor = self.backgroundColor ?: [UIColor systemBlueColor]; // 獲取原始顏色，默認為系統藍色
    UIColor *highlightColor = [originalColor colorWithAlphaComponent:0.5]; // 計算高亮顏色

    // 設置點擊時的動畫效果
    [UIView animateWithDuration:0.1 animations:^{
        self.transform = CGAffineTransformMakeScale(0.95, 0.95); // 縮放按鈕
        self.backgroundColor = highlightColor; // 改變背景顏色
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.transform = CGAffineTransformIdentity; // 還原按鈕大小
            self.backgroundColor = originalColor; // 還原背景顏色
        }];
    }];
}

@end
