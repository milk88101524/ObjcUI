//
//  ObjcSizedBox.h
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#ifndef ObjcSizedBox_h
#define ObjcSizedBox_h

#import <UIKit/UIKit.h> // 引入 UIKit 框架

@interface ObjcSizedBox : UIView // 定義 ObjcSizedBox 類，繼承自 UIView

@property (nonatomic, assign) CGFloat width; // 定義寬度屬性
@property (nonatomic, assign) CGFloat height; // 定義高度屬性
@property (nonatomic, strong) UIView *childView; // 定義子視圖屬性

// 類方法：創建帶有子視圖的 ObjcSizedBox
+ (instancetype)sizedBoxWithChild:(UIView *)child;

// 類方法：創建指定寬度的 ObjcSizedBox
+ (instancetype)sizedBoxWithWidth:(CGFloat)width;

// 類方法：創建指定高度的 ObjcSizedBox
+ (instancetype)sizedBoxWithHeight:(CGFloat)height;

// 類方法：創建指定寬度和高度的 ObjcSizedBox，並且包含子視圖
+ (instancetype)sizedBoxWithWidth:(CGFloat)width height:(CGFloat)height child:(UIView *)child;

@end

#endif /* ObjcSizedBox_h */
