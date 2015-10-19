//
//  ZBJSelectNumberViewController.h
//  WGNumberPicker
//
//  Created by 王刚 on 15/10/19.
//  Copyright © 2015年 王刚. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnPeopleCountBlcok) (NSInteger count);

@interface ZBJSelectNumberViewController : UIViewController

<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) NSNumber *maxCount;
@property (nonatomic,copy) ReturnPeopleCountBlcok returnPeopleCountBlock;
@property (nonatomic,strong) NSString *navTitle;

@end
