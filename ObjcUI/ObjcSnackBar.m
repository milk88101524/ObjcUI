//
//  ObjcSnackBar.m
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#import "ObjcSnackBar.h"

@implementation ObjcSnackBar

// 顯示只有文字的 SnackBar
+ (void)showSnackBarInView:(UIView *)view
                   message:(NSString *)message
                  duration:(ObjcSnackBarDuration)duration {
    ObjcSnackBar *snackBar = [[ObjcSnackBar alloc] initWithMessage:message];
    [snackBar showInView:view duration:duration];
}

// 初始化 SnackBar，設置顯示的消息
- (instancetype)initWithMessage:(NSString *)message {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8]; // 背景色設為半透明黑色
        self.layer.cornerRadius = 8.0; // 設置圓角
        
        // 創建消息標籤
        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.text = message; // 設置標籤文本
        self.messageLabel.textColor = [UIColor whiteColor]; // 設置文本顏色為白色
        self.messageLabel.numberOfLines = 0; // 允許多行顯示
        [self addSubview:self.messageLabel]; // 將標籤添加到 SnackBar 中
        [self setConstraints]; // 設置約束
    }
    return self;
}

// 設置標籤的約束
- (void)setConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動約束
    self.messageLabel.translatesAutoresizingMaskIntoConstraints = NO; // 禁用標籤的自動約束
    
    // 設置約束
    [NSLayoutConstraint activateConstraints:@[
        [self.messageLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16], // 標籤底部距離 SnackBar 底部16pt
        [self.messageLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16], // 標籤左邊距離 SnackBar 左邊16pt
        [self.messageLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-16], // 標籤右邊距離 SnackBar 右邊16pt
        [self.messageLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] // 標籤垂直居中
    ]];
}

// 在指定視圖中顯示 SnackBar，並設置顯示持續時間
- (void)showInView:(UIView *)view duration:(ObjcSnackBarDuration)duration {
    [view addSubview:self]; // 將 SnackBar 添加到指定視圖中
    
    self.alpha = 0; // 初始透明度設為 0，隱藏 SnackBar
    
    // 添加 SnackBar 的約束
    [NSLayoutConstraint activateConstraints:@[
        [self.leadingAnchor constraintEqualToAnchor:view.leadingAnchor constant:16], // SnackBar 左邊距16pt
        [self.trailingAnchor constraintEqualToAnchor:view.trailingAnchor constant:-16], // SnackBar 右邊距16pt
        [self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor constant:-50] // SnackBar 底部距離視圖底部50pt
    ]];
    
    // 顯示動畫
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1; // 透明度變為 1，顯示 SnackBar
    } completion:^(BOOL finished) {
        // 隱藏動畫
        [UIView animateWithDuration:0.3 delay:duration options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.alpha = 0; // 透明度變為 0，隱藏 SnackBar
        } completion:^(BOOL finished) {
            [self removeFromSuperview]; // 從父視圖中移除 SnackBar
        }];
    }];
}

// 隱藏 SnackBar 的方法
- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0; // 透明度變為 0，隱藏 SnackBar
    } completion:^(BOOL finished) {
        [self removeFromSuperview]; // 從父視圖中移除 SnackBar
    }];
}

@end
