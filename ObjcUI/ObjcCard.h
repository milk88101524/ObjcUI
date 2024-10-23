//
//  ObjcCard.h
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#ifndef ObjcUICard_h
#define ObjcUICard_h

#import <UIKit/UIKit.h> // 引入 UIKit 框架，這是 iOS 開發中使用的基本框架

@interface ObjcCard : UIView // 定義 ObjcCard 類，繼承自 UIView

@property (nonatomic, strong) UIView *contentView; // 定義 contentView 屬性，用來持有卡片內部的內容視圖

// 類方法：創建一個帶有內容視圖的 ObjcCard 實例
+ (instancetype)cardWithContent:(UIView *)content;

@end // 結束 ObjcCard 類的接口定義

#endif /* ObjcUICard_h */
