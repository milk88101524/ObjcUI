//
//  ObjcText.h
//  ObjcUI
//
//  Created by Han on 2024/10/18.
//

#ifndef ObjcText_h
#define ObjcText_h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ObjcTextFontStyle) {
    ObjcTextFontStyleRegular,     // Regular 字體樣式
    ObjcTextFontStyleBold,        // 粗體字
    ObjcTextFontStyleItalic,      // 斜體字
    ObjcTextFontStyleBoldItalic   // 粗斜體字
};

// 自定義的 UILabel 子類
@interface ObjcText : UILabel

// 類方法，用於創建帶有文本的 ObjcText 實例
+ (instancetype)text:(NSString *)content; // 提供初始文本的類方法

// 提供鏈式語法來設定字體顏色、大小和字體樣式
- (ObjcText *(^)(UIColor *color))setTextColor; // 設定字體顏色
- (ObjcText *(^)(CGFloat size))setFontSize; // 設定字體大小
- (ObjcText *(^)(ObjcTextFontStyle style))setFontStyle;  // 設定字體樣式

// 新增屬性，讓使用者可以使用點語法來設定字體大小和樣式
@property (nonatomic, assign) CGFloat fontSize; // 字體大小屬性
@property (nonatomic, assign) ObjcTextFontStyle fontStyle; // 字體樣式屬性

@end

#endif /* ObjcText_h */
