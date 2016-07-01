//
//  YXTHomeHeadView.m
//  YiXuanTongShop
//
//  Created by 汤天明 on 16/6/29.
//  Copyright © 2016年 easysay. All rights reserved.
//

#import "YXTHomeHeadView.h"
#import "YXTGoodsModel.h"
#import "UIImageView+AFNetworking.h"
#import "YXTBanner.h"
#import "UIView+Extension.h"

#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCROLLHEIGHT  200

@interface YXTHomeHeadView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;
@property (weak, nonatomic) IBOutlet UIButton * firstGoodsBtn;
/**被点击的按钮 */
@property(nonatomic,strong)UIButton *selectedBtn;
/**定时器 */
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation YXTHomeHeadView


+(instancetype)HomeHeadView
{
    YXTHomeHeadView *headView = [[[NSBundle mainBundle] loadNibNamed:@"YXTHomeHeadView" owner:nil options:nil] firstObject];
    
    headView.frame = CGRectMake(0, 0, SCREENWIDTH, SCROLLHEIGHT);
   // headView.backgroundColor = [UIColor redColor];
    return headView;
}

-(void)awakeFromNib
{
    self.scrollView.delegate = self;
    
}
-(void)setUIWith:(NSArray<YXTBanner *>*)models
{
    
    if (models == nil) {
        return;
    }
    for (int i = 0; i < _scrollView.subviews.count; i++)
    {
        UIView * view = _scrollView.subviews[i];
        [view removeFromSuperview];
        
    }
    _scrollView.contentSize = CGSizeMake(SCREENWIDTH * models.count, SCROLLHEIGHT);
    _pageControll.numberOfPages = models.count;
    
    if (_pageControll.currentPage > models.count) {
        _scrollView.contentOffset = CGPointZero;
        _pageControll.currentPage = 0;
    }
    for (int i = 0; i < models.count; i++) {
        YXTBanner *banner = models[i];
        UIImageView *bannerView = [[UIImageView alloc]initWithFrame:CGRectMake(_scrollView.x * i, 0, _scrollView.width, _scrollView.height)];
        
        
        [bannerView setImageWithURL:[NSURL URLWithString:banner.pictureUrl] ];
        [_scrollView addSubview:bannerView];
        
    }
    
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(pictureClick) userInfo:nil repeats:YES];
       
    }
}

-(void)pictureClick
{
    int i = _scrollView.contentOffset.x/_scrollView.width;
    
    if (i == _scrollView.subviews.count - 1) {
        _scrollView.contentOffset = CGPointZero;
        
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
            _scrollView.contentOffset = CGPointMake((i+1) *_scrollView.width, 0);
            
        }];
    }
    
    _pageControll.currentPage = _scrollView.contentOffset.x/_scrollView.width;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControll.currentPage = scrollView.contentOffset.x/scrollView.width;
}


#pragma 按钮响应方法
- (IBAction)selectedButtonIn:(UIButton *)sender {
   
    if (self.selectedBtn != sender)
        {
            self.selectedBtn = sender;
            for (UIButton *btn in sender.superview.subviews)
            {
                if ([btn isMemberOfClass:[UIButton class]]) {
                    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
                
            }
            [self.selectedBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            
        if ([_delegate respondsToSelector:@selector(selectedButtonWith:)])
        {
            [self.delegate selectedButtonWith:sender.tag];
        }
    }else
        return;
}

@end
