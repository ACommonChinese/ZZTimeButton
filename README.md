# ZZTimeButton
利用定时器，做一个获取验证码的倒计时的界面

**效果图**   
原始界面  
![](./ForReadMe/1.png)  

点击后  
![](./ForReadMe/2.png)  

超时后  
![](./ForReadMe/3.png)

使用方法：  

```
#import "ZZTimeButton.h"

ZZTimeButton *timeButton = [[ZZTimeButton alloc] initWithFrame:...];
timeButton.timeInterval = 10; // 设置超时时间为10秒，默认为60秒
...

```
