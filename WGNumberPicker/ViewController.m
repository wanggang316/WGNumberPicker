//
//  ViewController.m
//  WGNumberPicker
//
//  Created by 王刚 on 15/10/19.
//  Copyright © 2015年 王刚. All rights reserved.
//

#import "ViewController.h"
#import "ZBJNumberPicker.h"
#import "ZBJSelectNumberViewController.h"

@interface ViewController () <ZBJNumberPickerDelegate>

@property (nonatomic, strong) ZBJNumberPicker *numberPicker;
@property (nonatomic, strong) ZBJNumberPicker *numberPicker1;
@property (nonatomic, strong) ZBJNumberPicker *numberPicker2;
@property (nonatomic, strong) ZBJNumberPicker *numberPicker3;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1];
    
    [self.view addSubview:self.numberPicker];
    [self.view addSubview:self.numberPicker1];
    [self.view addSubview:self.numberPicker2];
    [self.view addSubview:self.numberPicker3];

}


- (ZBJNumberPicker *)numberPicker {
    if (!_numberPicker) {
        _numberPicker = [[ZBJNumberPicker alloc]initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.frame) - 40, 44)];
        _numberPicker.defaultValue = 0;
        _numberPicker.minValue = 0;
        _numberPicker.maxValue = 10;
        _numberPicker.tag = 10000;
    }
    return _numberPicker;
}

- (ZBJNumberPicker *)numberPicker1 {
    if (!_numberPicker1) {
        _numberPicker1 = [[ZBJNumberPicker alloc]initWithFrame:CGRectMake(20, 160, CGRectGetWidth(self.view.frame) - 40, 44)];
        _numberPicker1.delegate = self;
        _numberPicker1.tag = 10001;
        _numberPicker1.defaultValue = 0;
        _numberPicker1.minValue = 0;
        _numberPicker1.maxValue = 10;
    }
    return _numberPicker1;
}

- (ZBJNumberPicker *)numberPicker2 {
    if (!_numberPicker2) {
        _numberPicker2 = [[ZBJNumberPicker alloc]initWithFrame:CGRectMake(20, 220, CGRectGetWidth(self.view.frame) - 40, 44)];
        _numberPicker2.delegate = self;
        _numberPicker2.tag = 10002;
        _numberPicker2.defaultValue = 0;
        _numberPicker2.minValue = 0;
        _numberPicker2.maxValue = 10;
        
    }
    return _numberPicker2;
}

- (ZBJNumberPicker *)numberPicker3 {
    if (!_numberPicker3) {
        _numberPicker3 = [[ZBJNumberPicker alloc]initWithFrame:CGRectMake(20, 280, CGRectGetWidth(self.view.frame) - 40, 44)];
        _numberPicker3.delegate = self;
        _numberPicker3.tag = 10003;
        _numberPicker3.defaultValue = 1;
        _numberPicker3.minValue = 1;
        _numberPicker3.maxValue = 10;
        
    }
    return _numberPicker3;
}


#pragma mark - delegate

- (void)numberPicker:(ZBJNumberPicker *)numberPicker valueButton:(UIButton *)valueButton value:(NSInteger)value {
    
    switch (numberPicker.tag) {
        case 10001: {
            if (value == 0) {
                [valueButton setTitle:@"不限" forState:UIControlStateNormal];
            } else {
                [valueButton setTitle:[NSString stringWithFormat:@"%ld 人", value] forState:UIControlStateNormal];
            }
            break;
        }
        case 10002: {
            if (value == 0) {
                [valueButton setTitle:@"床位" forState:UIControlStateNormal];
                [valueButton setTitleColor:[UIColor colorWithRed:101.f/255.f green:102.f/255.f blue:102.f/255.f alpha:1.f] forState:UIControlStateNormal];
            } else if (value == numberPicker.maxValue) {
                [valueButton setTitle:[NSString stringWithFormat:@"%ld 床位+", value] forState:UIControlStateNormal];
                [valueButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            } else {
                [valueButton setTitle:[NSString stringWithFormat:@"%ld 床位", value] forState:UIControlStateNormal];
                [valueButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            }
            break;
        }
        case 10003: {
            [valueButton setTitle:[NSString stringWithFormat:@"%ld 人", value] forState:UIControlStateNormal];
            [valueButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            break;
        }
        default:
            break;
    }
}

- (void)numberPicker:(ZBJNumberPicker *)numberPicker didSelectedWithValue:(NSInteger)value {
    
    ZBJSelectNumberViewController *selectController = [[ZBJSelectNumberViewController alloc] init];
    selectController.maxCount = @(_numberPicker.maxValue);
    selectController.returnPeopleCountBlock = ^(NSInteger num){
        numberPicker.currentValue = num;
    };
    [self.navigationController pushViewController:selectController animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
