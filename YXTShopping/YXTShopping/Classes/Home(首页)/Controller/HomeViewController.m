//
//  HomeViewController.m
//  YiXuanTongShop
//
//  Created by 汤天明 on 16/6/28.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "HomeViewController.h"
//#import "AFNetworking.h"
//#import "UIKit+AFNetworking.h"
#import "YXTGoodsModel.h"
#import "YXTHomeHeadView.h"


@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,YXThomeHeadViewDelegate>

@property(nonatomic,strong)UITableView * tableView;

/**头视图 */
@property(nonatomic,strong)YXTHomeHeadView *headView;
/**商品模型数组 */
@property(nonatomic,strong)NSMutableArray <NSString *>*goodsArray;
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, YXTScreenW, YXTScreenH) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"YXTHomeHeadView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"HomeHead"];
    _headView = [YXTHomeHeadView HomeHeadView];
    _headView.delegate = self;
    [_headView setUIWith:nil];
    self.tableView.tableHeaderView = _headView;
    [self.view addSubview:self.tableView];
    
    [self selectedButtonWith:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.goodsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = self.goodsArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

#pragma headView代理方法的实现
//  根据按钮点击不同 加载下面表视图的内容
-(void)selectedButtonWith:(NSInteger)index
{
    NSLog(@"%ld",index);
    switch (index) {
        case 0:
            self.goodsArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
            
            break;
        case 1:
            self.goodsArray = [NSMutableArray arrayWithObjects:@"2",@"3",@"4",@"5", nil];
            break;
        case 2:
             self.goodsArray = [NSMutableArray arrayWithObjects:@"3",@"4",@"5",@"6", nil];
            break;
        default:
            break;
    }
    [self.tableView reloadData];
}
@end
