//
//  MemberCell.h
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/18.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberCell : UITableViewCell
/**
 *  成员的名字
 */
@property (nonatomic,strong) UILabel *nameLb;

/**
 *  加入状态
 */

@property (nonatomic,strong) UILabel *JoinLb;



@end
