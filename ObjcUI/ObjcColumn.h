//
//  ObjcColumn.h
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#ifndef ObjcUIColumn_h
#define ObjcUIColumn_h

#import <UIKit/UIKit.h>

@interface ObjcColumn : UIStackView

// 用於聲明式地創建 Column 並自動設置佈局
// 類方法，用來創建一個 ObjcColumn 並將提供的視圖 (views) 添加到超級視圖 (superview) 中
+ (instancetype)columnWithViews:(NSArray<UIView *> *)views inSuperview:(UIView *)superview;

// 修改器：設定對齊方式
// 這是一個鏈式調用的 Block 屬性，允許開發者設置 StackView 的對齊方式 (alignment)
// Block 參數：UIStackViewAlignment，用來指定對齊方式
// 回傳值：ObjcColumn 本身，以支援鏈式調用
@property (nonatomic, strong) ObjcColumn * (^setAlignment)(UIStackViewAlignment alignment);

// 修改器：設定間距
// 這也是一個鏈式調用的 Block 屬性，允許開發者設置子視圖之間的間距 (spacing)
// Block 參數：CGFloat，表示 StackView 子視圖之間的間距
// 回傳值：ObjcColumn 本身，以支援鏈式調用
@property (nonatomic, strong) ObjcColumn * (^setSpacing)(CGFloat spacing);

// 修改器：設定寬度
// 這是一個鏈式調用的 Block 屬性，允許開發者設置 StackView 的寬度 (width)
// Block 參數：CGFloat，指定 StackView 的固定寬度
// 回傳值：ObjcColumn 本身，以支援鏈式調用
@property (nonatomic, strong) ObjcColumn * (^setWidth)(CGFloat width);

@end

#endif /* ObjcUIColumn_h */
