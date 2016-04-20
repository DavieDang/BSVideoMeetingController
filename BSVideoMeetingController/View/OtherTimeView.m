//
//  OtherTimeView.m
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/20.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "OtherTimeView.h"
#import <Masonry.h>

@implementation OtherTimeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.leftTime.hidden = NO;
        self.endBtn.hidden = NO;
        self.line1.hidden = NO;
        self.compereBtn.hidden = NO;
        self.nameLb1.hidden = NO;
        
        self.leftTiltle.hidden = NO;
        self.DownLb.hidden = NO;
        
        
    }
    return self;
}


- (UIButton *)endBtn{
    if (!_endBtn) {
        _endBtn = [UIButton buttonWithType:0];
        [_endBtn setTitle:@"结束会议" forState:0];
        
        [_endBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:_endBtn];
        [self.endBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.leftTime.mas_right).mas_offset(46/2);
            make.top.mas_equalTo(88/2);
            make.right.mas_equalTo(-17);
            make.height.mas_equalTo(35);
            
        }];
    }
    return _endBtn;
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


- (UIButton *)compereBtn{
    if (!_compereBtn) {
        
        _compereBtn = [UIButton buttonWithType:0];
        [_compereBtn setTitle:@"会议主持人 :" forState:UIControlStateNormal];
        [_compereBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [_compereBtn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateHighlighted];
        [_compereBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 15, 8, 80)];
        [_compereBtn setTitleEdgeInsets:UIEdgeInsetsMake(14, 20, 10, 10)];
        
        _compereBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_compereBtn setTitleColor:[UIColor colorWithRed:86.0/255 green:86.0/255 blue:86.0/255 alpha:1] forState:UIControlStateNormal];
        
        [self addSubview: self.compereBtn];
        [self.compereBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.line1.mas_bottom).mas_offset(0);
            make.bottom.mas_equalTo(-8);
            make.right.mas_equalTo(-245);
        }];
    }
    
    return _compereBtn;
}




- (UILabel *)nameLb1{
    if (!_nameLb1) {
        _nameLb1 = [UILabel new];
        [self addSubview:_nameLb1];
        
        _nameLb1.text = @"黄经理";
        _nameLb1.textAlignment = NSTextAlignmentLeft;
        _nameLb1.font = [UIFont systemFontOfSize:13];
        
        _nameLb1.textColor = [UIColor colorWithRed:86.0/255 green:86.0/255 blue:86.0/255 alpha:1];
        
        [self.nameLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.compereBtn.mas_right);
            make.centerY.mas_equalTo(self.compereBtn);
            //make.top.mas_equalTo(self.compereBtn);
        }];
        
    }
    return _nameLb1;
    
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


@end
