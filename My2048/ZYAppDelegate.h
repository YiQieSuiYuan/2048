//
//  ZYAppDelegate.h
//  My2048
//
//  Created by 张雷 on 14-7-20.
//  Copyright (c) 2014年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"

#define NOMOVE  0
#define UP      1
#define DOWN    2
#define LEFT    3
#define RIGHT   4

@interface ZYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MyButton *button1, *button2, *button3, *button4, *button5, *button6, *button7, *button8, *button9, *button10, *button11, *button12, *button13, *button14, *button15, *button16;
@property (strong, nonatomic) UILabel *fenShu;
@property (strong, nonatomic) UILabel *zuiGaoFenShu;
@property int fenShuZhi,zuiGaoFenShuZhi;
//开始点坐标
@property CGPoint beginPoint;
//结束点坐标
@property CGPoint endPoint;
//触摸滑动方向
@property int direction;
//可变数组变量
@property (strong, nonatomic) NSMutableArray *mutableArray;

@end
