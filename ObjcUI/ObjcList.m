//
//  ObjcList.m
//  ObjcUI
//
//  Created by Han on 2024/10/21.
//

#import "ObjcList.h" // 引入 ObjcList 的頭文件

@implementation ObjcList

// 類方法：創建 ObjcList 實例，傳入數據、項目構建器和父視圖
+ (instancetype)listWithData:(NSArray *)data itemBuilder:(UIView * (^)(id item))itemBuilder inSuperview:(UIView *)superview {
    ObjcList *listView = [[self alloc] init]; // 創建 ObjcList 的實例
    listView.data = data; // 設置數據源
    listView.itemBuilder = itemBuilder; // 設置項目構建器
    
    // 初始化 UITableView
    listView.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    listView.tableView.dataSource = listView; // 設置數據源為自己
    listView.tableView.delegate = listView; // 設置代理為自己
    
    // 自動計算行高
    listView.tableView.rowHeight = UITableViewAutomaticDimension;
    
    // 設置分隔線樣式
    listView.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 設置 Auto Layout
    listView.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 將表格視圖添加到父視圖
    [superview addSubview:listView.tableView];
    
    // 設置表格視圖的約束條件，讓它填滿父視圖
    [NSLayoutConstraint activateConstraints:@[
        [listView.tableView.topAnchor constraintEqualToAnchor:superview.topAnchor],
        [listView.tableView.bottomAnchor constraintEqualToAnchor:superview.bottomAnchor],
        [listView.tableView.leadingAnchor constraintEqualToAnchor:superview.leadingAnchor],
        [listView.tableView.trailingAnchor constraintEqualToAnchor:superview.trailingAnchor]
    ]];
    
    return listView; // 返回創建的 ObjcList 實例
}

// 返回表格中的行數
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count; // 返回數據源中的項目數
}

// 返回表格中每一行的單元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 嘗試重用單元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        // 如果沒有可重用的單元格，則創建一個新的單元格
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    } else {
        // 如果重用單元格，清除其內容
        for (UIView *subview in cell.contentView.subviews) {
            [subview removeFromSuperview];
        }
    }
    
    // 根據數據源創建項目視圖
    UIView *itemView = self.itemBuilder(self.data[indexPath.row]);
    [cell.contentView addSubview:itemView]; // 將項目視圖添加到單元格的內容視圖中
    
    itemView.translatesAutoresizingMaskIntoConstraints = NO; // 啟用 Auto Layout
    // 設置項目視圖的約束條件，使其填滿單元格
    [NSLayoutConstraint activateConstraints:@[
        [itemView.topAnchor constraintEqualToAnchor:cell.contentView.topAnchor],
        [itemView.bottomAnchor constraintEqualToAnchor:cell.contentView.bottomAnchor],
        [itemView.leadingAnchor constraintEqualToAnchor:cell.contentView.leadingAnchor],
        [itemView.trailingAnchor constraintEqualToAnchor:cell.contentView.trailingAnchor]
    ]];
    
    return cell; // 返回單元格
}

// 當行被高亮顯示時的回調
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tableView.rowHeight = UITableViewAutomaticDimension; // 設置行高為自動
}

@end
