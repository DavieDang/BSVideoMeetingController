//
//  SelectTimeView.h
//  BSVideoMeetingController
//
//  Created by BingoMacMini on 16/4/20.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TimeView.h"
#import "OtherTimeView.h"

//按标识传入是否是主持人的View

typedef NS_ENUM(NSUInteger, TimeViewType) {
    timeViewType = 0,
    otherTimeViewType,
};


@interface SelectTimeView : NSObject

@property (nonatomic,strong) TimeView *timeView;
@property (nonatomic,strong) OtherTimeView *otherView;

- (void)showTimeView:(TimeViewType)type ToVC:(UIViewController *)vc completionHandle:(void(^)())completionHandle;

@end
