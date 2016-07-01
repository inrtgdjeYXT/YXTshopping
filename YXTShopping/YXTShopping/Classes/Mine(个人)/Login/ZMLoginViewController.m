//
//  ZMLoginViewController.m
//  YiXuanTongShop
//
//  Created by czm on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "ZMLoginViewController.h"
#import "ErrorView.h"
#import "ZMRegistViewController.h"
#import "SVProgressHUD.h"
#import "ZMUserManager.h"

@interface ZMLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *checkCode;

@end

@implementation ZMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    
    _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _checkCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)login:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if(_userName.text.length && _passWord.text.length && _checkCode.text.length){
        //开始登录,判断验证码的合法性
        if([_checkCode.text isEqualToString:@"123"]){
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            
            dict[@"userId"] = _userName.text;
            dict[@"password"] = _passWord.text;
            
            //登录操作
            [SVProgressHUD showWithStatus:@"正在登录中……"];
            
            [[ZMUserManager shareZMUserManager] loginWith:^(BOOL isSuccess) {
                
                if(isSuccess){
                    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                    
                    
                }else{
                    [SVProgressHUD showErrorWithStatus:@"登录失败"];
                }
                
            } andParameters:dict];
            
        }else{
            [ErrorView showWithTitle:@"请输入正确的验证码"];
        }
        
    }else{
        //用户名密码验证码为空
        [ErrorView showWithTitle:@"账户登录内容不能为空"];
    }
}


- (IBAction)regist:(UIButton *)sender {
    ZMRegistViewController *registVc = [[ZMRegistViewController alloc] initWithNibName:@"ZMRegistViewController" bundle:nil];
    
    registVc.userBlock = ^(NSString *name, NSString *password){
        name = _userName.text;
        password = _passWord.text;
    };
    
    [self.navigationController pushViewController:registVc animated:YES];
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

@end
