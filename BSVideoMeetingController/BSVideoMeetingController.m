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

//#import "TimecountDown.h"

#import "SelectTimeView.h"



#define kWIDTH  [UIScreen mainScreen].bounds.size.width
#define kHEIGHT  [UIScreen mainScreen].bounds.size.height

@interface BSVideoMeetingController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (assign) BOOL isOpen;
//@property (nonatomic,strong) TimeView *timeView;
@property (nonatomic,strong) VideoView *videoView;


//延长会议的时间
@property (nonatomic,strong) UIPickerView *pickerView;


//成员是否加入视频会议
@property (assign) BOOL isJoin;

//延长的时间的数组

@property (nonatomic,strong) NSMutableArray *timeArr;


//显示不同的TimeView的类
@property (nonatomic,strong) SelectTimeView *selectView;


//设置一个开关-----转移主持人时弹出来的Cell中Label变Button

@property (nonatomic,assign) BOOL isHasBtn;

 

@end

@implementation BSVideoMeetingController


//

- (SelectTimeView *)selectView{
    if (!_selectView) {
        _selectView = [SelectTimeView new];
        
    }
    return _selectView;
}




//视频的View

- (VideoView *)videoView{
    if (!_videoView) {
        _videoView = [VideoView new];
        
        [self.view addSubview:_videoView];
        
        self.videoView.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
        [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(224);
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



- (UIPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [UIPickerView new];
        
        _pickerView.backgroundColor = [UIColor whiteColor];
         [_pickerView selectRow:3 inComponent:1 animated:YES];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        
       
        
        [self.view addSubview:_pickerView];
        [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(244);
            
        }];
        
    }
    return _pickerView;
}


- (NSMutableArray *)timeArr{
    if (!_timeArr) {
        _timeArr = [NSMutableArray arrayWithCapacity:5];
        [_timeArr addObject:@"5分钟"];
        [_timeArr addObject:@"10分钟"];
        [_timeArr addObject:@"30分钟"];
        [_timeArr addObject:@"1小时"];
        [_timeArr addObject:@"2小时"];
    }
    return _timeArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.selectView showTimeView:timeViewType ToVC:self completionHandle:nil];
    
    
    //添加按钮的点击事件
    [self.selectView.timeView.extendBtn addTarget:self action:@selector(extendMeet) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView.timeView.endBtn addTarget:self action:@selector(endMeet) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView.timeView.transferBtn addTarget:self action:@selector(transferEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView.timeView.SilenceBtn addTarget:self action:@selector(silenceEvent:) forControlEvents:UIControlEventTouchUpInside];;
    [self.selectView.timeView.recordBtn addTarget:self action:@selector(recordEvent:) forControlEvents:UIControlEventTouchUpInside];;
    [self.selectView.otherView.endBtn addTarget:self action:@selector(endMeet) forControlEvents:UIControlEventTouchUpInside];
    
    
 
    

    //是否打开成员列表
    self.isOpen = NO;
   self.videoView.hidden = NO;

    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /**
     *  导航栏
     */
    
   
    self.title = @"视频会议";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:14/255.0 green:141/255.0 blue:235/255.0 alpha:1];
    
    
    /**
     *  测试代码建立倒计时
   
     */
    
       [self startTime:10];

}

#pragma mark ------UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
 
    return 25;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.nameLb.text = @"成员姓名";
        cell.backgroundColor = [UIColor colorWithRed:14/255.0 green:141/255.0 blue:235/255.0 alpha:1];
    
    

    
    
    
    
    //是否加入视频会议的状态
//    self.isJoin = YES;//设置一个默认值
//    cell.JoinLb.text = self.isJoin ? @"已加入":@"待加入";
    
    if (self.isHasBtn == NO) {
        cell.moveBtn.hidden = YES;
        self.isJoin = YES;//设置一个默认值
        cell.JoinLb.text = self.isJoin ? @"已加入":@"待加入";
    }else{
        
        cell.JoinLb.hidden = YES;
       [cell.moveBtn setTitle:@"转移主持人" forState:0];
    }
    
    
    return cell;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    self.isHasBtn = NO;
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
     [self.tableView reloadData];
    
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
       
    }
    
  
    
}


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
    self.pickerView.hidden = NO;
   
    
    
}

//退出会议

- (void)endMeet{
    NSLog(@"退出会议.......");
    
}


//转移主持人
- (void)transferEvent:(UIButton *)sender{
    NSLog(@"转移主持人....");
    self.isHasBtn = YES;
    [self.tableView reloadData];
    [self pushView];
    
}


//会议录音

- (void)recordEvent:(UIButton *)sender{
    sender.selected = !sender.selected;
    NSLog(@"会议录音....");
}



//全场静音

- (void)silenceEvent:(UIButton *)sender{
    sender.selected = !sender.selected;
    NSLog(@"全场静音.....");
}




#pragma mark-------UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.timeArr.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.timeArr[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"你点击了%ld行",row);
    
    self.pickerView.hidden = YES;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 48;
}


#pragma mark ---- 建立倒计时

/**
 *  会议倒计时的时间
 *
 *  @param countTime 倒计时的时间是多少秒钟
 */

-(void)startTime:(NSInteger)countTime{
    
    __block int timeDown = (int)countTime;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeDown < 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
            });
        }else{
            
            int seconds = timeDown % 60;
            int minute = timeDown / 60;
            int hour = timeDown / 3600;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.selectView.timeView.DownLb.text = [NSString stringWithFormat:@"%.2d : %.2d : %.2d",hour,minute,seconds];
            });
            timeDown--;
            
        }
    });
    dispatch_resume(_timer);
    
}



@end
