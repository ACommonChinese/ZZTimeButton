//
//  ViewController.m
//  ZZTimeButton
//
//  Created by 刘威振 on 1/13/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import "ViewController.h"
#import "ZZTimeButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ZZTimeButton *timeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timeButton.timeInterval = 10;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)getVerifyCode:(ZZTimeButton *)timeButton {
    NSLog(@"获取验证码...");
}

- (void)dealloc {
    NSLog(@"内存没有问题，%s", __FUNCTION__);
    // [self.timeButton invalidTimer];
}

@end
