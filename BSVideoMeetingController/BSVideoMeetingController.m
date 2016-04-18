//
//  BSVideoMeetingController.m
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/18.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BSVideoMeetingController.h"
#import "MemberCell.h"
#import <Masonry.h>
#import "TimeView.h"
#import "VideoView.h"


#define kWIDTH  [UIScreen mainScreen].bounds.size.width
#define kHEIGHT  [UIScreen mainScreen].bounds.size.height

@interface BSVideoMeetingController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (assign) BOOL isOpen;
@property (nonatomic,strong) TimeView *timeView;

@property (nonatomic,strong) VideoView *videoView;


//测试成员是否加入视频会议
@property (assign) BOOL isJoin;
 

@end

@implementation BSVideoMeetingController


//时间的View

- (TimeView *)timeView{
    if (!_timeView) {
        _timeView = [[TimeView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_timeView];
        self.timeView.backgroundColor = [UIColor whiteColor];
        self.timeView.line1.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
         self.timeView.line2.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
         self.timeView.line3.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
        [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(64);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(160);
        }];
    }
    return _timeView;
}



//视频的View

- (VideoView *)videoView{
    if (!_videoView) {
        _videoView = [VideoView new];
        
        [self.view addSubview:_videoView];
        
        self.videoView.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
        [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.timeView.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-55);
        }];
    }
    return _videoView;
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _timeView.hidden = NO;
        
        [self.view addSubview:_tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.leftMargin.rightMargin.mas_equalTo(0);
            make.topMargin.mas_equalTo(kHEIGHT - 45);
            
        }];
        
        
        
        [_tableView registerClass:[MemberCell class] forCellReuseIdentifier:@"Cell"];
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.isOpen = NO;
    self.timeView.leftTime.hidden = NO;
    self.videoView.hidden = NO;
    [self.timeView.extendBtn addTarget:self action:@selector(extendMeet) forControlEvents:UIControlEventTouchUpInside];
    [self.timeView.endBtn addTarget:self action:@selector(endMeet) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    /**
     *  导航栏
     */
    
   
    self.title = @"视频会议";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:141/255.0 blue:235/255.0 alpha:1];
    
    

}

#pragma mark ------UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
 
    return 25;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    
    //成员姓名
    cell.nameLb.text = @"成员姓名";
        cell.backgroundColor = [UIColor colorWithRed:14/255.0 green:141/255.0 blue:235/255.0 alpha:1];
    
    //是否加入视频会议的状态
    
     self.isJoin = YES;//设置一个默认值
    cell.JoinLb.text = self.isJoin ? @"已加入":@"待加入";

    
    

    
    return cell;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithRed:14/255.0 green:141/255.0 blue:235/255.0 alpha:1];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"其他成员" forState:0];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTintColor:[UIColor whiteColor]];
    
    [button addTarget:self action:@selector(pushView) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.bottom.mas_equalTo(-8);
        make.size.mas_equalTo(CGSizeMake(70, 18));
        
 
    }];
   
    return view;
    
}


- (void)pushView{
    
    self.isOpen = !self.isOpen;
    if (self.isOpen == YES) {

      
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.leftMargin.rightMargin.mas_equalTo(0);
            make.topMargin.mas_equalTo(64);
        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [self.view layoutIfNeeded];
            
        } completion:nil];
        
        [self.tableView reloadData];
        
    }else{
       
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.leftMargin.rightMargin.mas_equalTo(0);
            make.topMargin.mas_equalTo(kHEIGHT - 45);
        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            [self.view layoutIfNeeded];
            
        } completion:nil];
        
        [self.tableView reloadData];
         self.timeView.hidden = NO;

    }
    
  
    
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return UITableViewAutomaticDimension;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 37;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 55;
    
}



//去掉分割线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    
}

//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark ----- 按钮的点击事件

//延长会议
- (void)extendMeet{
    
    NSLog(@"延长会议.......");
}

//退出会议

- (void)endMeet{
    NSLog(@"退出会议.......");
    
}


@end
