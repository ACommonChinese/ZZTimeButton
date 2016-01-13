//
//  ZZTimeButton.m
//  ZZTimeButton
//
//  Created by 刘威振 on 1/13/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import "ZZTimeButton.h"
#import <objc/runtime.h>

@interface ZZTimeButton ()

@property (nonatomic) UILabel *showLabel;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) NSInteger decreaseInterval;
@end

@implementation ZZTimeButton

- (UILabel *)showLabel {
    if (_showLabel == nil) {
        _showLabel                 = [[UILabel alloc] initWithFrame:self.bounds];
        _showLabel.backgroundColor = [UIColor clearColor];
        _showLabel.font            = [self.titleLabel font];
        _showLabel.textColor       = [self titleColorForState:UIControlStateNormal];
        _showLabel.textAlignment   = NSTextAlignmentCenter;
        [self setTitle:nil forState:UIControlStateNormal];
        [self addSubview:_showLabel];
    }
    return _showLabel;
}

- (void)setTimeInterval:(NSInteger)timeInterval {
    _timeInterval = timeInterval;
    self.decreaseInterval = _timeInterval;
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    self.enabled = NO;
    if (self.decreaseInterval == 0) {
        self.decreaseInterval = 60;
    }
    self.showLabel.text = [NSString stringWithFormat:@"%ld", self.decreaseInterval];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES]; // 定时器会强引用target, 所以要注意在适当的时候invalidate
    
    [super sendAction:action to:target forEvent:event];
}

- (void)timerAction {
    --self.decreaseInterval;
    if (self.decreaseInterval <= 0) {
        [self.timer invalidate], self.timer = nil;
        self.showLabel.text = @"重新获取";
        self.enabled = YES;
        self.decreaseInterval = self.timeInterval;
        return;
    }
    // [self setTitle:[NSString stringWithFormat:@"%ld", self.timeInterval] forState:UIControlStateNormal];
    self.showLabel.text = [NSString stringWithFormat:@"%ld", self.decreaseInterval];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        [self.timer invalidate], self.timer = nil;
    }
}

- (void)invalidTimer {
    [self.timer invalidate], self.timer = nil;
}

- (void)dealloc {
    NSLog(@"内存没有问题，%s", __FUNCTION__);
}

@end
