//
//  OtherTimeView.h
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/20.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherTimeView : UIView

/**
 *  结束会议
 */
@property (nonatomic,strong) UIButton *endBtn;
//时间的View
@property (nonatomic,strong) UIView *leftTime;
//下划线
@property (nonatomic,strong) UIView *line1;
//会议主持人
@property (nonatomic,strong) UIButton *compereBtn;

//姓名
@property (nonatomic,strong) UILabel *nameLb1;


//倒计时的时间

@property (nonatomic,strong) UILabel *DownLb;

//距离会议结束还有

@property (nonatomic,strong) UILabel *leftTiltle;


@end
