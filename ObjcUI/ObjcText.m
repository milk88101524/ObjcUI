//
//  ObjcText.m
//  ObjcUI
//
//  Created by Han on 2024/10/18.
//

#import "ObjcText.h"

@implementation ObjcText

// 類方法：用來創建一個 ObjcText 標籤，並設置默認的字體大小和樣式
+ (instancetype)text:(NSString *)content {
    ObjcText *label = [[self alloc] init]; // 創建一個 ObjcText 的實例
    label.text = content; // 設置文本內容
    label.fontSize = 17.0; // 設置默認的字體大小為 17.0
    label.fontStyle = ObjcTextFontStyleRegular; // 設置默認的字體樣式為 Regular（正常字體）
    return label; // 返回這個實例
}

// 設置字體顏色的 Block 方法，返回 self 以便鏈式調用
- (ObjcText *(^)(UIColor *color))setTextColor {
    return ^ObjcText *(UIColor *color) {
        self.textColor = color; // 設置 textColor 屬性為傳入的顏色
        return self; // 返回自身，以便進行鏈式調用
    };
}

// 設置字體大小的 Block 方法，返回 self 以便鏈式調用
- (ObjcText *(^)(CGFloat size))setFontSize {
    return ^ObjcText *(CGFloat size) {
        self.fontSize = size; // 更新 fontSize 屬性為傳入的字體大小
        [self updateFont]; // 調用更新字體方法來反映更改
        return self; // 返回自身
    };
}

// 設置字體樣式的 Block 方法，返回 self 以便鏈式調用
- (ObjcText *(^)(ObjcTextFontStyle style))setFontStyle {
    return ^ObjcText *(ObjcTextFontStyle style) {
        self.fontStyle = style; // 更新 fontStyle 屬性為傳入的字體樣式
        [self updateFont]; // 調用更新字體方法
        return self; // 返回自身
    };
}

// 根據當前的字體大小和樣式更新字體的內部方法
- (void)updateFont {
    UIFont *font;
    switch (self.fontStyle) { // 根據 fontStyle 屬性來決定字體樣式
        case ObjcTextFontStyleBold:
            font = [UIFont boldSystemFontOfSize:self.fontSize]; // 設置粗體
            break;
        case ObjcTextFontStyleItalic:
            font = [UIFont italicSystemFontOfSize:self.fontSize]; // 設置斜體
            break;
        case ObjcTextFontStyleBoldItalic:
            // 設置粗斜體，使用 fontDescriptor 來組合粗體和斜體屬性
            font = [UIFont fontWithDescriptor:[UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorTraitsAttribute: @{UIFontWeightTrait: @(UIFontWeightBold), UIFontSlantTrait: @(1)}}] size:self.fontSize];
            break;
        default:
            font = [UIFont systemFontOfSize:self.fontSize]; // 默認為普通字體
            break;
    }
    self.font = font; // 將計算出的字體設置給標籤
}

@end
