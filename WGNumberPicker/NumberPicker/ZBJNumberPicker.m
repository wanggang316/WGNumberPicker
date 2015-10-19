//
//  ZBJNumberPicker.m
//  zbj-iPhone
//
//  Created by 王刚 on 15/10/19.
//  Copyright © 2015年 ZhuBaiJia. All rights reserved.
//

#import "ZBJNumberPicker.h"

#define LineColor [UIColor colorWithRed:227.f/255.f green:230.f/255.f blue:230.f/255.f alpha:1.f]
#define FontColor [UIColor colorWithRed:101.f/255.f green:102.f/255.f blue:102.f/255.f alpha:1.f]
@interface ZBJNumberPicker()

@property (nonatomic, strong) UIButton *valueButton;
@property (nonatomic, strong) UIButton *minusButton;
@property (nonatomic, strong) UIButton *plusButton;

@property (nonatomic, strong) CALayer *leftLine;
@property (nonatomic, strong) CALayer *rightLine;
@property (nonatomic, strong) CALayer *bottomLine;
@end

@implementation ZBJNumberPicker

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.minusButton];
        [self addSubview:self.plusButton];
        [self addSubview:self.valueButton];
        
        [self.layer addSublayer:self.leftLine];
        [self.layer addSublayer:self.rightLine];
        [self.layer addSublayer:self.bottomLine];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.minusButton.frame = CGRectMake(3, (CGRectGetHeight(self.frame) - 44)/2, 44, 44);
    self.plusButton.frame = CGRectMake(CGRectGetWidth(self.frame) - CGRectGetWidth(self.minusButton.frame) - 3, CGRectGetMinY(self.minusButton.frame), CGRectGetWidth(self.minusButton.frame), CGRectGetHeight(self.minusButton.frame));
    
    self.leftLine.frame = CGRectMake(CGRectGetMaxX(self.minusButton.frame), 10, 0.5, CGRectGetHeight(self.frame)-20);
    self.rightLine.frame = CGRectMake(CGRectGetMinX(self.plusButton.frame), 10, 0.5, CGRectGetHeight(self.frame)-20);
    
    self.valueButton.frame = CGRectMake(CGRectGetMaxX(self.leftLine.frame), CGRectGetMinY(self.minusButton.frame), CGRectGetMinX(self.rightLine.frame) - CGRectGetMaxX(self.minusButton.frame), CGRectGetHeight(self.minusButton.frame));
  
    self.bottomLine.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5);
}


#pragma mark - events 
- (void)minusPressed:(id)sender {
    NSInteger newValue = self.currentValue - 1;
    if (newValue >= self.minValue) {
        self.currentValue = newValue;
    }
}

- (void)plusPressed:(id)sender {
    NSInteger newValue = self.currentValue + 1;
    if (newValue <= self.maxValue) {
        self.currentValue = newValue;
    }
}

- (void)valuePrssed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberPicker:didSelectedWithValue:)]) {
        [self.delegate numberPicker:self didSelectedWithValue:self.currentValue];
    }
}

#pragma mark - getter and setter
- (UIButton *)valueButton {
    if (!_valueButton) {
        _valueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_valueButton setTitleColor:FontColor forState:UIControlStateNormal];
        _valueButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_valueButton addTarget:self action:@selector(valuePrssed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _valueButton;
}

- (UIButton *)minusButton {
    if (!_minusButton) {
        _minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_minusButton setImage:[UIImage imageNamed:@"minus_icon"] forState:UIControlStateNormal];
        [_minusButton addTarget:self action:@selector(minusPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_minusButton setContentEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    }
    return _minusButton;
}

- (UIButton *)plusButton {
    if (!_plusButton) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setImage:[UIImage imageNamed:@"plus_icon"] forState:UIControlStateNormal];
        [_plusButton addTarget:self action:@selector(plusPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_plusButton setContentEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    }
    return _plusButton;
}

- (CALayer *)leftLine {
    if (!_leftLine) {
        _leftLine = [CALayer layer];
        _leftLine.backgroundColor = LineColor.CGColor;
    }
    return _leftLine;
}

- (CALayer *)rightLine {
    if (!_rightLine) {
        _rightLine = [CALayer layer];
        _rightLine.backgroundColor = LineColor.CGColor;
    }
    return _rightLine;
}

- (CALayer *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [CALayer layer];
        _bottomLine.backgroundColor = LineColor.CGColor;
    }
    return _bottomLine;
}


- (void)setDefaultValue:(NSInteger)defaultValue {
    _defaultValue = defaultValue;
    self.currentValue = _defaultValue;
}

- (void)setCurrentValue:(NSInteger)currentValue {
    _currentValue = currentValue;
    
    [self.valueButton setTitle:[NSString stringWithFormat:@"%ld", _currentValue] forState:UIControlStateNormal];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberPicker:valueButton:value:)]) {
        [self.delegate numberPicker:self valueButton:self.valueButton value:_currentValue];
    } 
}

@end
