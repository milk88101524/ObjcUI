//
//  ObjcRow.h
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#ifndef ObjcRow_h
#define ObjcRow_h

#import <UIKit/UIKit.h>

@interface ObjcRow : UIStackView

// 用於聲明式地創建 Row 並自動設置佈局
// 類方法，用來創建一個 ObjcRow 並將提供的視圖 (views) 添加到超級視圖 (superview) 中
+ (instancetype)rowWithViews:(NSArray<UIView *> *)views inSuperview:(UIView *)superview;

// 修改器：設定對齊方式
// 鏈式調用的 Block 屬性，用來設置 StackView 的對齊方式
// Block 參數：UIStackViewAlignment，指定對齊方式
// 回傳值：ObjcRow 本身，支援鏈式調用
@property (nonatomic, strong) ObjcRow * (^setAlignment)(UIStackViewAlignment alignment);

// 修改器：設定間距
// 鏈式調用的 Block 屬性，用來設置子視圖之間的間距
// Block 參數：CGFloat，指定 StackView 子視圖之間的間距
// 回傳值：ObjcRow 本身，支援鏈式調用
@property (nonatomic, strong) ObjcRow * (^setSpacing)(CGFloat spacing);

@end

#endif /* ObjcRow_h */
