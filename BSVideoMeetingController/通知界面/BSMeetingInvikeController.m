//
//  BSMeetingInvikeController.m
//  BSMeetingInvikeController
//
//  Created by BingoMacMini on 16/4/15.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BSMeetingInvikeController.h"
#import "BSVideoMeetingController.h"

@interface BSMeetingInvikeController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UIButton *acceptBtn;
@property (weak, nonatomic) IBOutlet UIButton *refuseBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headView;

@end

@implementation BSMeetingInvikeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.headView.layer.cornerRadius = 5.0f;
    self.headView.layer.masksToBounds = YES;
    
    self.acceptBtn.layer.cornerRadius = 37.5f;
    self.acceptBtn.layer.masksToBounds = YES;
    
    self.refuseBtn.layer.cornerRadius = 37.5f;
    self.refuseBtn.layer.masksToBounds = YES;
    
    //发起邀请的人
    self.nameLb.text = @"黄经理";//自定义
    
    //设计界面的背景图片
   // self.bgImageView.image = [UIImage imageNamed:@""];
    
    /**
     *  设置头像  拒绝 接听按钮的图片
     */
    
    //self.headView.image = [UIImage imageNamed:@""];
    
    //self.refuseBtn setImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>
   // self.acceptBtn setImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//拒绝
- (IBAction)refuseBtn:(id)sender {
    NSLog(@"拒绝");
}
//接受
- (IBAction)accept:(id)sender {

    // NSLog(@"接受");

    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:[BSVideoMeetingController new]];
    
    [self presentViewController:navc animated:YES completion:nil];
    
    
    
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
