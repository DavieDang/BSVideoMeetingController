//
//  TimeView.m
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/18.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "TimeView.h"
#import <Masonry.h>



#define kWIDTH  [UIScreen mainScreen].bounds.size.width
#define kHEIGHT  [UIScreen mainScreen].bounds.size.height

@implementation TimeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (UIView *)leftTime{
    if (!_leftTime) {
        _leftTime = [[UIView alloc]init];
        _leftTime.backgroundColor = [UIColor colorWithRed:248.0/255 green:248.0/255 blue:248.0/255 alpha:1.0];
        [self addSubview:_leftTime];
        [self.leftTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(220, 120));
        }];
    }
    return _leftTime;
}

//延长会议
- (UIButton *)extendBtn{
    if (!_extendBtn) {
        _extendBtn  = [UIButton buttonWithType:0];
        [_extendBtn setTitle:@"延长会议" forState:0];
        [_extendBtn setTitleColor:[UIColor colorWithRed:84.0/255 green:207.0/255 blue:205.0/255 alpha:1.0] forState:UIControlStateNormal];
        [self addSubview:_extendBtn];
        [self.extendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.leftTime.mas_right).mas_offset(46/2);
            make.top.mas_equalTo(37/2);
            make.right.mas_equalTo(-7);
            make.height.mas_equalTo(35);
            
        }];  
    }
    return _extendBtn;
}

//退出会议
- (UIButton *)endBtn{
    if (!_endBtn) {
        _endBtn = [UIButton buttonWithType:0];
        [_endBtn setTitle:@"退出会议" forState:0];

         [_endBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:_endBtn];
        [self.endBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.extendBtn);
            make.rightMargin.mas_equalTo(self.extendBtn);
            make.height.mas_equalTo(self.extendBtn);
            make.top.mas_equalTo(self.extendBtn.mas_bottom).mas_offset(15);
        }];
        
    }
    return _endBtn;
}


- (UIView *)line1{
    if (!_line1) {
        _line1 = [UIView new];
        
        [self addSubview:_line1];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.leftTime.mas_bottom).mas_offset(0);
            make.height.mas_equalTo(2);
            make.left.right.mas_equalTo(0);

        }];
        
    }
    return _line1;
}

- (UIView *)line2{
    if (!_line2) {
        _line2 = [UIView new];
        
        [self addSubview:_line2];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line1.mas_bottom);
            make.width.mas_equalTo(2);
            make.height.mas_equalTo(38);
            make.left.mas_equalTo(kWIDTH/3-1);
            
        }];
        
    }
    return _line2;
}

- (UIView *)line3{
    if (!_line3) {
        _line3 = [UIView new];
        
        [self addSubview:_line3];
        [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line1.mas_bottom);
            make.width.mas_equalTo(2);
            make.height.mas_equalTo(38);
            make.left.mas_equalTo(kWIDTH*2/3-1);
           
            
        }];
        
    }
    return _line3;
}



@end
