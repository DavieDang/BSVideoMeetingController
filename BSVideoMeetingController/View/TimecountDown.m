//
//  TimecountDown.m
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/20.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "TimecountDown.h"

@implementation TimecountDown

+(TimecountDown *)sharedInstance{
    static TimecountDown *countDown = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        countDown = [[TimecountDown alloc]init];
    });
    return countDown;
    
}

-(void)startTime:(int)countTime{
    
    __block int timeDown = countTime;
    self.timeLb = [UILabel new];
    // self.countTime = countTime; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeDown<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置

            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeDown % 60;
            int minute = timeDown / 60;
            int hour = timeDown / 3600;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
               // NSLog(@"____%@",secStr);
                self.timeLb.text = [NSString stringWithFormat:@"%.2d : %.2d : %.2d",hour,minute,seconds];
                NSLog(@"===========%@",self.timeLb.text);
                
            });
            timeDown--;
            
        }
    });
    dispatch_resume(_timer);
    
}


@end
