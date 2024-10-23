//
//  ObjcPadding.h
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#ifndef ObjcPadding_h
#define ObjcPadding_h

#import <UIKit/UIKit.h>

@interface ObjcPadding : UIView

// viewPaddingWithInsets
+ (instancetype)viewPaddingWithInsets:(UIEdgeInsets)insets view:(UIView *)view inSuperview:(UIView *)superview;

// 使用內邊距和子視圖來創建一個 ObjcPadding
+ (instancetype)paddingWithInsets:(UIEdgeInsets)insets view:(UIView *)view;

@end

#endif /* ObjcPadding_h */
