//
//  TimeView.h
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/18.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeView : UIView

//延长会议
@property (nonatomic,strong) UIButton *extendBtn;

//退出会议
@property (nonatomic,strong) UIButton *endBtn;

//时间的View
@property (nonatomic,strong) UIView *leftTime;


//转移主持人
@property (nonatomic,strong) UIButton *transferBtn;
//录音
@property (nonatomic,strong) UIButton *recordBtn;
//静音
@property (nonatomic,strong) UIButton *SilenceBtn;


//下划线
@property (nonatomic,strong) UIView *line1;
@property (nonatomic,strong) UIView *line2;
@property (nonatomic,strong) UIView *line3;







@end
