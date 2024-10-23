//
//  ObjcColumn.m
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#import "ObjcColumn.h"

@implementation ObjcColumn

// 類方法，建立一個垂直方向的 StackView，並將傳入的視圖陣列添加到 StackView 中
+ (instancetype)columnWithViews:(NSArray<UIView *> *)views inSuperview:(UIView *)superview {
    // 初始化一個 ObjcColumn 實例
    ObjcColumn *stackView = [[self alloc] init];
    
    // 設置方向為垂直 (vertical)
    stackView.axis = UILayoutConstraintAxisVertical;
    
    // 禁用自動轉換 Auto Layout 約束，改為手動設置
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 將傳入的視圖陣列逐個添加到 StackView 中
    for (UIView *view in views) {
        [stackView addArrangedSubview:view];
    }
    
    // 將 StackView 添加到指定的超級視圖 (superview)
    [superview addSubview:stackView];
    
    // 回傳這個 StackView 實例
    return stackView;
}

// 設置對齊方式的鏈式調用函式
- (ObjcColumn * (^)(UIStackViewAlignment))setAlignment {
    // 傳回一個 Block，允許設定對齊方式
    return ^ObjcColumn *(UIStackViewAlignment alignment) {
        // 設置 StackView 的對齊方式
        self.alignment = alignment;
        // 回傳自身以進行鏈式調用
        return self;
    };
}

// 設置間距的鏈式調用函式
- (ObjcColumn * (^)(CGFloat))setSpacing {
    // 傳回一個 Block，允許設定間距
    return ^ObjcColumn *(CGFloat spacing) {
        // 設置 StackView 子視圖間的間距
        self.spacing = spacing;
        // 回傳自身以進行鏈式調用
        return self;
    };
}

// 新增設置寬度的函式，允許指定 StackView 寬度
- (ObjcColumn * (^)(CGFloat))setWidth {
    // 傳回一個 Block，允許設定寬度
    return ^ObjcColumn *(CGFloat width) {
        // 設置寬度約束，並啟動該約束
        [NSLayoutConstraint activateConstraints:@[
            [self.widthAnchor constraintEqualToConstant:width]
        ]];
        // 回傳自身以進行鏈式調用
        return self;
    };
}

@end
