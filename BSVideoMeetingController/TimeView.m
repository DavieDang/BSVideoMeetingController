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
        
        self.line1.hidden = NO;
        self.line2.hidden = NO;
        self.line3.hidden = NO;
        self.extendBtn.hidden = NO;
        self.leftTime.hidden = NO;
        self.endBtn.hidden = NO;
        self.transferBtn.hidden = NO;
        self.recordBtn.hidden = NO;
        self.SilenceBtn.hidden = NO;
        self.leftTiltle.hidden = NO;
        self.DownLb.hidden = NO;
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


//

- (UILabel *)leftTiltle{
    if (!_leftTiltle) {
        
        _leftTiltle = [UILabel new];
        _leftTiltle.text = @"距会议结束还有";
          _leftTiltle.textColor = [UIColor colorWithRed:110.0/255 green:110.0/255 blue:110.0/255 alpha:1.0];
        _leftTiltle.font = [UIFont systemFontOfSize:15];
        [self.leftTime addSubview:self.leftTiltle];
        [self.leftTiltle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(150, 20));
            
        }];
    }
    
    return _leftTiltle;
}


//倒计时
-(UILabel *)DownLb{
    if (!_DownLb) {
        _DownLb = [UILabel new];
        _DownLb.font = [UIFont systemFontOfSize:30];
        
        //字符串拼接显示
        _DownLb.text = @"00 : 00 : 00";
        
        _DownLb.textColor = [UIColor colorWithRed:31.0/255 green:148.0/255 blue:234.0/255 alpha:1.0];
        [self.leftTime addSubview:self.DownLb];
        [self.DownLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.leftTiltle.mas_bottom).mas_offset(25);
            make.left.mas_equalTo(32);
            make.right.mas_equalTo(-25);
            make.bottom.mas_equalTo(-30);
            
        }];
        
        
        
    }
    return _DownLb;
}


//延长会议
- (UIButton *)extendBtn{
    if (!_extendBtn) {
        _extendBtn  = [UIButton buttonWithType:0];
      
        _extendBtn.layer.borderColor = [[UIColor colorWithRed:84.0/255 green:207.0/255 blue:205.0/255 alpha:1.0] CGColor];
        _extendBtn.layer.borderWidth = 1.0f;
        _extendBtn.layer.cornerRadius = 5.0f;
        _extendBtn.layer.masksToBounds = YES;
        
   
        [_extendBtn setTitle:@"延长会议" forState:0];
        _extendBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_extendBtn setTitleColor:[UIColor colorWithRed:84.0/255 green:207.0/255 blue:205.0/255 alpha:1.0] forState:UIControlStateNormal];
        [_extendBtn setImage:[UIImage imageNamed:@"时间"] forState:UIControlStateNormal];
        [_extendBtn setImageEdgeInsets:UIEdgeInsetsMake(5,5,5,80)];
        [_extendBtn setTitleEdgeInsets:UIEdgeInsetsMake(5,0,0,5)];
        [self addSubview:_extendBtn];
        [self.extendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.leftTime.mas_right).mas_offset(20);
            make.top.mas_equalTo(19);
            make.right.mas_equalTo(-10);
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
        
        _endBtn.layer.borderColor = [[UIColor redColor] CGColor];
        _endBtn.layer.borderWidth = 1.0f;
        _endBtn.layer.cornerRadius = 5.0f;
        _endBtn.layer.masksToBounds = YES;
        
        _endBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_endBtn setImage:[UIImage imageNamed:@"tel"] forState:UIControlStateNormal];
        [_endBtn setImageEdgeInsets:UIEdgeInsetsMake(5,5,8,80)];
        [_endBtn setTitleEdgeInsets:UIEdgeInsetsMake(5,0,0,5)];

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
          _line1.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
        
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
        
            _line2.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
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
            _line3.backgroundColor = [UIColor colorWithRed:234.0/255 green:234.0/255 blue:234.0/255 alpha:1.0];
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


//转移主持人

- (UIButton *)transferBtn{
    if (!_transferBtn) {
        _transferBtn = [UIButton buttonWithType:0];
        
        [_transferBtn setTitle:@"转移主持人" forState:UIControlStateNormal];
        [_transferBtn setImage:[UIImage imageNamed:@"iconfont-jiudianwuxianhuatong32px"] forState:UIControlStateNormal];
        [_transferBtn setImage:[UIImage imageNamed:@"iconfont-jiudianwuxianhuatong32px"] forState:UIControlStateSelected];
        [_transferBtn setImageEdgeInsets:UIEdgeInsetsMake(12, 15, 10, 110)];
        [_transferBtn setTitleEdgeInsets:UIEdgeInsetsMake(12, 0, 10, 30)];
        
        _transferBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_transferBtn setTitleColor:[UIColor colorWithRed:86.0/255 green:86.0/255 blue:86.0/255 alpha:1] forState:UIControlStateNormal];
        
        
        [self addSubview: _transferBtn];
        [self.transferBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.line1.mas_bottom).mas_offset(0);
            make.bottom.mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.line2.mas_leftMargin);
        }];
    }
    
    return _transferBtn;
}

//会议录音

-(UIButton *)recordBtn{
    if (!_recordBtn) {
        _recordBtn = [UIButton buttonWithType:0];
        
        
        
        
        [_recordBtn setImage:[UIImage imageNamed:@"iconfont-luyin"] forState:UIControlStateNormal];
        [_recordBtn setImage:[UIImage imageNamed:@"录音"] forState:UIControlStateSelected];
        [_recordBtn setTitle:@"会议录音" forState:UIControlStateNormal];
        [_recordBtn setTitle:@"取消录音" forState:UIControlStateSelected];
        
        
        [_recordBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 15, 10, 90)];
        [_recordBtn setTitleEdgeInsets:UIEdgeInsetsMake(12, 0, 10, 20)];
        
        
       
        
    //    _recordBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        
        

        
        
        _recordBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_recordBtn setTitleColor:[UIColor colorWithRed:86.0/255 green:86.0/255 blue:86.0/255 alpha:1] forState:UIControlStateNormal];
        
        
        [self addSubview: _recordBtn];
        [self.recordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.line2.mas_right);
            make.top.mas_equalTo(self.line1.mas_bottom).mas_offset(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(self.line3.mas_right);
        }];
    
    
    }
    return _recordBtn;
    
}

//全场静音
- (UIButton *)SilenceBtn{
    if (!_SilenceBtn) {
        _SilenceBtn = [UIButton buttonWithType:0];
        
        [_SilenceBtn setTitle:@"全场静音" forState:UIControlStateNormal];
        [_SilenceBtn setTitle:@"取消静音" forState:UIControlStateSelected];
     
        [_SilenceBtn setImage:[UIImage imageNamed:@"话筒"] forState:UIControlStateNormal];
        [_SilenceBtn setImage:[UIImage imageNamed:@"静音"] forState:UIControlStateSelected];
        [_SilenceBtn setImageEdgeInsets:UIEdgeInsetsMake(12, 15, 10, 100)];
        [_SilenceBtn setTitleEdgeInsets:UIEdgeInsetsMake(12, 0, 10, 25)];
        _SilenceBtn.titleLabel.font = [UIFont systemFontOfSize:13];

        [_SilenceBtn setTitleColor:[UIColor colorWithRed:86.0/255 green:86.0/255 blue:86.0/255 alpha:1] forState:UIControlStateNormal];
        
        
        [self addSubview: _SilenceBtn];
        [self.SilenceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.line3.mas_right);
            make.top.mas_equalTo(self.line1.mas_bottom).mas_offset(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];

        
    }
    return _SilenceBtn;
}


@end
