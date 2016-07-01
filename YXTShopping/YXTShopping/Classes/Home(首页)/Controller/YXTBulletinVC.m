//
//  YXTBulletinVC.m
//  YiXuanTongShop
//
//  Created by 汤天明 on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "YXTBulletinVC.h"
#import "detailBulletinVC.h"
@interface YXTBulletinVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YXTBulletinVC

-(NSMutableArray *)bulletinArrays
{
    if (_bulletinArrays == nil) {
        _bulletinArrays = [NSMutableArray array];
    }
    return _bulletinArrays;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 64;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 公告的总条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
    

}

// 点击哪一条公告后跳转到对应的具体公告内容

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailBulletinVC * activility = [[detailBulletinVC alloc]init];
    
    [self.navigationController pushViewController:activility animated:YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
