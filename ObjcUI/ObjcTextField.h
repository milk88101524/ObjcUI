//
//  ObjcTextField.h
//  ObjcUI
//
//  Created by Han on 2024/10/20.
//

#ifndef ObjcTextField_h
#define ObjcTextField_h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ShapeStyle) {
    ShapeStyleRoundedRect,
    ShapeStyleCircle,
    ShapeStyleCustom
};

@interface ObjcTextField : UITextField

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                            inSuperview:(UIView *)superview;

- (ObjcTextField * (^)(NSString *))setPlaceholder;

- (ObjcTextField * (^)(void(^)(NSString *text)))onTextChange;

- (ObjcTextField * (^)(ShapeStyle))shape;

- (ObjcTextField * (^)(CGFloat))setWidth;

@end

#endif /* ObjcTextField_h */
