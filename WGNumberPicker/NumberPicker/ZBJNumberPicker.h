//
//  ZBJNumberPicker.h
//  zbj-iPhone
//
//  Created by 王刚 on 15/10/19.
//  Copyright © 2015年 ZhuBaiJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZBJNumberPickerDelegate;
@interface ZBJNumberPicker : UIView

@property (nonatomic, weak) id<ZBJNumberPickerDelegate> delegate;

@property (nonatomic, assign) NSInteger minValue;
@property (nonatomic, assign) NSInteger maxValue;
@property (nonatomic, assign) NSInteger currentValue;
@property (nonatomic, assign) NSInteger defaultValue;

@end

@protocol ZBJNumberPickerDelegate <NSObject>

@optional
- (void)numberPicker:(ZBJNumberPicker *)numberPicker valueButton:(UIButton *)valueButton value:(NSInteger)value;
- (void)numberPicker:(ZBJNumberPicker *)numberPicker didSelectedWithValue:(NSInteger)value;

@end