//
//  TimecountDown.h
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/20.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  倒计时的类用于时间倒计的显示
 */

@interface TimecountDown : NSObject

//公开一个接口   传递倒计时的时间
@property (nonatomic,strong) UILabel *timeLb;

@property (nonatomic,assign) int countTime;


+(TimecountDown *)sharedInstance;

-(void)startTime:(int)countTime;



@end
