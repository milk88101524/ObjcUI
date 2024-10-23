//
//  ObjcTextField.m
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#import "ObjcTextField.h" // 引入 ObjcTextField 的頭文件
#import <objc/runtime.h>   // 引入 Objective-C 運行時庫，用於動態特性

@implementation ObjcTextField

// 定義內部邊距
CGFloat padding = 16.0;

// 類方法：創建一個 ObjcTextField 實例並設置佔位符
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                             inSuperview:(UIView *)superview {
    ObjcTextField *textField = [[ObjcTextField alloc] init]; // 初始化文本框
    textField.translatesAutoresizingMaskIntoConstraints = NO; // 取消自動約束
    textField.placeholder = placeholder; // 設置佔位符
    
    // 設置文本框邊框屬性
    textField.layer.borderWidth = 1; // 邊框寬度
    textField.layer.borderColor = UIColor.systemGray4Color.CGColor; // 邊框顏色
    
    // 將文本框添加到父視圖中
    [superview addSubview:textField];
    
    // 設置文本框寬度與父視圖相等
    [textField.widthAnchor constraintEqualToAnchor:superview.widthAnchor].active = YES;
    
    return textField; // 返回創建的文本框
}

// 鏈式調用方法：設置佔位符
- (ObjcTextField * (^)(NSString *))setPlaceholder {
    return ^ObjcTextField *(NSString *placeholder) { // 返回一個設置佔位符的塊
        self.placeholder = placeholder; // 設置佔位符
        return self; // 返回當前實例以支持鏈式調用
    };
}

// 鏈式調用方法：設置文本變化事件的回調
- (ObjcTextField * (^)(void(^)(NSString *)))onTextChange {
    return ^ObjcTextField *(void (^callback)(NSString *)) { // 返回一個設置回調的塊
        [self addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged]; // 當文本變化時調用 textDidChange 方法
        objc_setAssociatedObject(self, @selector(textDidChange), callback, OBJC_ASSOCIATION_COPY_NONATOMIC); // 將回調與文本框關聯
        return self; // 返回當前實例以支持鏈式調用
    };
}

// 文本變化時的回調方法
- (void)textDidChange {
    void (^callback)(NSString *) = objc_getAssociatedObject(self, @selector(textDidChange)); // 獲取關聯的回調
    if (callback) {
        callback(self.text); // 調用回調並傳遞當前文本
    }
}

// 鏈式調用方法：設置形狀樣式
- (ObjcTextField * (^)(ShapeStyle))shape {
    return ^ObjcTextField *(ShapeStyle style) { // 返回一個設置形狀的塊
        switch (style) { // 根據樣式設置形狀
            case ShapeStyleRoundedRect: // 圓角矩形
                self.layer.cornerRadius = 8; // 設置圓角半徑
                self.clipsToBounds = YES; // 使圓角生效
                self.borderStyle = UITextBorderStyleNone; // 不顯示邊框樣式
                break;
                
            case ShapeStyleCircle: // 圓形
                self.layer.cornerRadius = self.frame.size.height / 2; // 設置圓形的圓角半徑
                self.clipsToBounds = YES; // 使圓角生效
                self.borderStyle = UITextBorderStyleNone; // 不顯示邊框樣式
                break;
                
            case ShapeStyleCustom: // 自定義樣式
                self.layer.cornerRadius = 15; // 設置圓角半徑
                self.layer.borderColor = UIColor.systemBlueColor.CGColor; // 設置邊框顏色
                self.layer.borderWidth = 2; // 設置邊框寬度
                break;
        }
        return self; // 返回當前實例以支持鏈式調用
    };
}

// 鏈式調用方法：設置文本框寬度
- (ObjcTextField * (^)(CGFloat))setWidth {
    return ^ObjcTextField *(CGFloat width) { // 返回一個設置寬度的塊
        [self.widthAnchor constraintEqualToConstant:width].active = YES; // 設置文本框的寬度
        return self; // 返回當前實例以支持鏈式調用
    };
}

// 重寫方法：返回文本框內容的矩形區域
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, padding, padding); // 根據內部邊距返回文本矩形區域
}

// 重寫方法：返回正在編輯的文本框內容的矩形區域
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, padding, padding); // 根據內部邊距返回編輯矩形區域
}

// 重寫方法：返回佔位符的矩形區域
- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, padding, padding); // 根據內部邊距返回佔位符矩形區域
}

@end
