//
//  MemberCell.m
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/18.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "MemberCell.h"
#import <Masonry.h>

@implementation MemberCell

//初始化cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    
    return self;
}


- (UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        
        _nameLb.font = [UIFont systemFontOfSize:17];
        _nameLb.textColor = [UIColor whiteColor];
        _nameLb.numberOfLines = 0;
        _nameLb.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_nameLb];
        
        [self.nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.centerY.mas_equalTo(self);
            
        }];
        
        
    }
    return _nameLb;
}

- (UILabel *)JoinLb{
    if (!_JoinLb) {
        _JoinLb = [UILabel new];
        _JoinLb.font = [UIFont systemFontOfSize:17];
        _JoinLb.textColor = [UIColor whiteColor];
        _JoinLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_JoinLb];
        [self.JoinLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(self);
            
            
        }];
    }
    return _JoinLb;
}


- (UIButton *)moveBtn{
    if (!_moveBtn) {
        _moveBtn = [UIButton buttonWithType:0];
        _moveBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_moveBtn setTitleColor:[UIColor whiteColor] forState:0];
        _moveBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview:self.moveBtn];
        [self.moveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(self);
        }];
        
        
    }
    
    return _moveBtn;
}

@end
