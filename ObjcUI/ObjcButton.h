//
//  ObjcButton.h
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#ifndef ObjcUIButton_h
#define ObjcUIButton_h

#import <UIKit/UIKit.h>

@interface ObjcButton : UIButton

// 類方法：用來創建帶有標籤的 ObjcButton 實例，並添加到指定的父視圖中
+ (instancetype)buttonWithLabel:(UIView *)label inSuperview:(UIView *)superview;

// 設置按鈕的點擊事件的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(void(^)(void)))setOnTap;

// 設置按鈕背景顏色的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(UIColor *color))setBackgroundColor;

// 設置按鈕邊框的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(UIColor *color, CGFloat width))setBorder;

// 設置按鈕圓角半徑的 Block 方法，返回自身以便鏈式調用
- (ObjcButton * (^)(CGFloat radius))setCornerRadius;

@end

#endif /* ObjcUIButton_h */

