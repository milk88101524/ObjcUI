//
//  ObjcSnackBar.h
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#ifndef ObjcSnackBar_h
#define ObjcSnackBar_h

#import <UIKit/UIKit.h>

// 定義一個枚舉，用於表示 ObjcSnackBar 的顯示持續時間
typedef NS_ENUM(NSInteger, ObjcSnackBarDuration) {
    ObjcSnackBarDurationShort = 2, // 2 秒
    ObjcSnackBarDurationLong = 5   // 5 秒
};

@interface ObjcSnackBar : UIView

@property (nonatomic, strong) UILabel *messageLabel; // 顯示消息的標籤

// 顯示 SnackBar 的靜態方法
+ (void)showSnackBarInView:(UIView *)view
                   message:(NSString *)message
                  duration:(ObjcSnackBarDuration)duration;

@end

#endif /* ObjcSnackBar_h */
