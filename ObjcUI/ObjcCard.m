//
//  ObjcCard.m
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#import "ObjcCard.h" // 引入 ObjcCard 的頭文件

@implementation ObjcCard // 開始 ObjcCard 類的實現

// 類方法：創建帶有內容的 ObjcCard 實例
+ (instancetype)cardWithContent:(UIView *)content {
    ObjcCard *card = [[ObjcCard alloc] initWithContent:content]; // 初始化 ObjcCard 實例
    return card; // 返回創建的實例
}

// 初始化方法：接受一個 UIView 作為內容
- (instancetype)initWithContent:(UIView *)content {
    self = [super initWithFrame:CGRectZero]; // 調用父類的初始化方法，設置初始大小為 CGRectZero
    if (self) {
        self.backgroundColor = [UIColor whiteColor]; // 設置背景顏色為白色
        self.layer.cornerRadius = 14.0; // 設置圓角半徑，讓卡片邊角變圓

        // 設置陰影效果
        self.layer.shadowColor = [UIColor blackColor].CGColor; // 設置陰影顏色為黑色
        self.layer.shadowOffset = CGSizeMake(0, 3); // 設置陰影的偏移量（X: 0, Y: 3）
        self.layer.shadowOpacity = 0.3; // 設置陰影的不透明度
        self.layer.shadowRadius = 4.0; // 設置陰影的模糊半徑

        self.contentView = content; // 將傳入的 content 視圖賦值給 contentView
        [self addSubview:self.contentView]; // 將 contentView 添加到 ObjcCard 的視圖層級中

        self.contentView.translatesAutoresizingMaskIntoConstraints = NO; // 禁用自動調整大小，使用 Auto Layout

        // 使用 Auto Layout 設置 contentView 的約束
        [NSLayoutConstraint activateConstraints:@[
            [self.contentView.topAnchor constraintEqualToAnchor:self.topAnchor constant:8], // 上邊距
            [self.contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8], // 下邊距
            [self.contentView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:8], // 左邊距
            [self.contentView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-8] // 右邊距
        ]];
    }
    return self; // 返回初始化後的實例
}

@end // 結束 ObjcCard 類的實現
