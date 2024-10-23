//
//  ObjcSafeArea.h
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#ifndef ObjcSafeArea_h
#define ObjcSafeArea_h

#import <UIKit/UIKit.h>

@interface ObjcSafeArea : UIView

// 用於創建一個 SafeArea 視圖並自動設置其在超級視圖中的位置
// view: 要放置在 SafeArea 內的子視圖
// superview: 這個 SafeArea 要添加到的超級視圖
+ (instancetype)safeAreaWithView:(UIView *)view inSuperview:(UIView *)superview;

@end

#endif /* ObjcSafeArea_h */
