//
//  detailBulletinVC.m
//  YXTShopping
//
//  Created by 汤天明 on 16/7/1.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "detailBulletinVC.h"

@interface detailBulletinVC ()


@end

@implementation detailBulletinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回主页" style:UIBarButtonItemStyleDone target:self action:@selector(backToRootVC:)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)backToRootVC:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
