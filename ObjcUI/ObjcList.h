//
//  ObjcList.h
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#ifndef ObjcUIList_h
#define ObjcUIList_h

#import <UIKit/UIKit.h> // 引入 UIKit 框架

// ObjcList 類定義，遵循 UITableViewDataSource 和 UITableViewDelegate 協議
@interface ObjcList : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView; // 表格視圖，用於顯示數據
@property (nonatomic, strong) NSArray *data; // 數據源，用於填充表格視圖
@property (nonatomic, copy) UIView * (^itemBuilder)(id item); // 用於構建單個項目的閉包

// 類方法：創建 ObjcList 實例，傳入數據、項目構建器和父視圖
+ (instancetype)listWithData:(NSArray *)data itemBuilder:(UIView * (^)(id item))itemBuilder inSuperview:(UIView *)superview;

@end

#endif /* ObjcUIList_h */
