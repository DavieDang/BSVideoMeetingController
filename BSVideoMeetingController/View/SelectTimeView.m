//
//  SelectTimeView.m
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/20.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "SelectTimeView.h"
#import <Masonry.h>

@implementation SelectTimeView

//时间的View

- (TimeView *)timeView{
    if (!_timeView) {
        _timeView = [[TimeView alloc]initWithFrame:CGRectZero];
        self.timeView.backgroundColor = [UIColor whiteColor];

    }
    return _timeView;
}


- (OtherTimeView *)otherView{
    if (!_otherView) {
        _otherView = [[OtherTimeView alloc]initWithFrame:CGRectZero];
        self.otherView.backgroundColor = [UIColor whiteColor];
    }
    return _otherView;
}




- (void)showTimeView:(TimeViewType)type ToVC:(UIViewController *)vc completionHandle:(void (^)())completionHandle{
    
    if (type == timeViewType) {
        [vc.view addSubview:self.timeView];
        [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(64);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(160);
        }];
        
        self.otherView.hidden = YES;
        
    }
    
    if (type == otherTimeViewType) {
        [vc.view addSubview:self.otherView];
        [self.otherView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(64);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(160);
        }];
        self.timeView.hidden = YES;
    }
}


@end
