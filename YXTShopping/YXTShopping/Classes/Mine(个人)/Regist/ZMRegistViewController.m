//
//  ZMRegistViewController.m
//  YiXuanTongShop
//
//  Created by czm on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "ZMRegistViewController.h"
#import "ErrorView.h"
#import "ZMPhoneNumber.h"

#import "ZMUserManager.h"

#import "SVProgressHUD.h"
#import "ZMUserManager.h"

@interface ZMRegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *checkPassWord;
@property (weak, nonatomic) IBOutlet UITextField *otherName;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *emails;

@end

@implementation ZMRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)regist:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if([self checkUserInformation]){
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        dict[@"userId"] = _userName.text;
        dict[@"password"] = _passWord.text;
        dict[@"username"] = _otherName.text;
        dict[@"contactPhone"] = _phoneNumber.text;
        dict[@"address"] = _address.text;
        dict[@"email"] = _emails.text;
        
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
        
        [[ZMUserManager shareZMUserManager] registWith:^(BOOL isSuccess) {
            if(isSuccess){
                
                
            }else{
                [SVProgressHUD showErrorWithStatus:@"注册失败,请重新注册!"];
            }
        } andParameters:dict];
        
    }
    
    
    
}

//注册帐号前,判断帐号的合法性
- (BOOL)checkUserInformation{
    if(_userName.text.length == 0){
        [ErrorView showWithTitle:@"用户名不能为空"];
        return NO;
    }
    if(_passWord.text.length == 0 || _checkPassWord.text.length == 0){
        [ErrorView showWithTitle:@"密码不能为空"];
        return NO;
    }
    if(![self checkIsHaveNumAndLetter:_userName.text]){
        [ErrorView showWithTitle:@"用户名格式不正确"];
        return NO;
    }
    if(![_passWord.text isEqualToString:_checkPassWord.text]){
        [ErrorView showWithTitle:@"密码设置不一致"];
        return NO;
    }
    if([ZMPhoneNumber validatePhoneNumber:_phoneNumber.text]){
        return YES;
    }else{
        [ErrorView showWithTitle:@"请输入正确的联系方式"];
        return NO;
    }
}

//用户名的判断
- (BOOL)checkIsHaveNumAndLetter:(NSString*)userName{
    //数字条件
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //符合数字条件的有几个字节
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:userName
                                                                       options:NSMatchingReportProgress
                                                                         range:NSMakeRange(0, userName.length)];
    
    //英文字条件
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //符合英文字条件的有几个字节
    NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:userName options:NSMatchingReportProgress range:NSMakeRange(0, userName.length)];
    
    if (tNumMatchCount + tLetterMatchCount == userName.length) {
        //符合英文和符合数字条件的相加等于密码长度
        return YES;
    } else {
        return NO;
        //可能包含标点符号的情況，或是包含非英文的文字，这里再依照需求详细判断想呈现的错误
    }
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
