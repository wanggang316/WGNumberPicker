//
//  ZBJSelectNumberViewController.m
//  WGNumberPicker
//
//  Created by 王刚 on 15/10/19.
//  Copyright © 2015年 王刚. All rights reserved.
//

#import "ZBJSelectNumberViewController.h"


@interface ZBJSelectNumberViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ZBJSelectNumberViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray arrayWithCapacity:12];
    self.tableView.backgroundColor = [UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    if (self.navTitle) {
        self.title = self.navTitle;
    }else{
        self.title = @"选择人数";
    }
    self.tableView.tableFooterView = [[UIView alloc]init];
    if (self.navTitle) {
        for (int i = 0; i <[self.maxCount integerValue]; i++) {
            NSString *string = [NSString stringWithFormat:@"%d 个",i + 1];
            [self.dataArray addObject:string];
        }
    }else{
        
        for (int i = 0; i <[self.maxCount integerValue]; i++) {
            NSString *string = [NSString stringWithFormat:@"%d 人",i + 1];
            [self.dataArray addObject:string];
        }
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray.count > 0) {
        return self.dataArray.count;
    }else{
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifer = @"cellIndentifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.returnPeopleCountBlock) {
        self.returnPeopleCountBlock(indexPath.row + 1);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
