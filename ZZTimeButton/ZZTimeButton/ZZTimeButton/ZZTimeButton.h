//
//  ZZTimeButton.h
//  ZZTimeButton
//
//  Created by 刘威振 on 1/13/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZTimeButton : UIButton

@property (nonatomic) NSInteger timeInterval; // 以秒为单位，默认为6

-  (void)invalidTimer;
@end
