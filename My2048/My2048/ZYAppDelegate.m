//
//  ZYAppDelegate.m
//  My2048
//
//  Created by 张雷 on 14-7-20.
//  Copyright (c) 2014年 zhiyou. All rights reserved.
//

#import "ZYAppDelegate.h"

@implementation ZYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor colorWithRed:249/255.0 green:248/255.0 blue:237/255.0 alpha:1];
    [self.window makeKeyAndVisible];
    
    
//图片2048
    UIImageView *view2048 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2048天.png"]];
    view2048.frame = CGRectMake(55/2, 25, 100, 100);
    [self.window addSubview:view2048];
    
//标签
    //分数
    UILabel *fenShuLabel = [[UILabel alloc]initWithFrame:CGRectMake(140, 35, 70, 25)];
    fenShuLabel.textAlignment = NSTextAlignmentCenter;
    
    fenShuLabel.text = @"分数";
    fenShuLabel.backgroundColor = [UIColor colorWithRed:173/255.0 green:158/255.0 blue:144/255.0 alpha:1];
    fenShuLabel.textColor = [UIColor colorWithRed:235/255.0 green:223/255.0 blue:211/255.0 alpha:1];
    [self.window addSubview:fenShuLabel];
    //分数值
    _fenShu  = [[UILabel alloc]initWithFrame:CGRectMake(140, 60, 70, 20)];
    _fenShu.text = @"0";
    _fenShu.textColor = [UIColor whiteColor];
    _fenShu.backgroundColor = [UIColor colorWithRed:173/255.0 green:158/255.0 blue:144/255.0 alpha:1];
    _fenShu.textAlignment = NSTextAlignmentCenter;
    [self.window addSubview:_fenShu];
    
    //最高分数
    UILabel *zuiGaoFenShuLabel = [[UILabel alloc]initWithFrame:CGRectMake(222.5, 35, 70, 25)];
    zuiGaoFenShuLabel.textAlignment = NSTextAlignmentCenter;
    
    zuiGaoFenShuLabel.text = @"最高分数";
    zuiGaoFenShuLabel.backgroundColor = [UIColor colorWithRed:173/255.0 green:158/255.0 blue:144/255.0 alpha:1];
    zuiGaoFenShuLabel.textColor = [UIColor colorWithRed:235/255.0 green:223/255.0 blue:211/255.0 alpha:1];
    [self.window addSubview:zuiGaoFenShuLabel];
    //最高分数值
    _zuiGaoFenShu  = [[UILabel alloc]initWithFrame:CGRectMake(222.5, 60, 70, 20)];
    _zuiGaoFenShu.text = @"0";
    _zuiGaoFenShu.textColor = [UIColor whiteColor];
    _zuiGaoFenShu.backgroundColor = [UIColor colorWithRed:173/255.0 green:158/255.0 blue:144/255.0 alpha:1];
    _zuiGaoFenShu.textAlignment = NSTextAlignmentCenter;
    [self.window addSubview:_zuiGaoFenShu];

//界面背景
    UILabel *jieMian = [[UILabel alloc]initWithFrame:CGRectMake(55/2, 140, 265, 265)];
    jieMian.backgroundColor = [UIColor colorWithRed:173/255.0 green:158/255.0 blue:144/255.0 alpha:1];
    [self.window addSubview:jieMian];
    
//自定义按钮
    //按钮1
    _button1 = [[MyButton alloc]initWithFrame:CGRectMake(32.5, 145, 60, 60)];
    _button1.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button1.tag = 1;
    //[_button1 setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button1];
    //按钮2
    _button2 = [[MyButton alloc]initWithFrame:CGRectMake(97.5, 145, 60, 60)];
    _button2.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button2.tag = 2;
    [_button2 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button2];
    //按钮3
    _button3 = [[MyButton alloc]initWithFrame:CGRectMake(162.5, 145, 60, 60)];
    _button3.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button3.tag = 3;
    [_button3 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button3];
    //按钮4
    _button4 = [[MyButton alloc]initWithFrame:CGRectMake(227.5, 145, 60, 60)];
    _button4.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button4.tag = 4;
    [_button4 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button4];
    
    //按钮5
    _button5 = [[MyButton alloc]initWithFrame:CGRectMake(32.5, 210, 60, 60)];
    _button5.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button5.tag = 5;
    [_button5 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button5];
    //按钮6
    _button6 = [[MyButton alloc]initWithFrame:CGRectMake(97.5, 210, 60, 60)];
    _button6.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button6.tag = 6;
    [_button6 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button6];
    //按钮7
    _button7 = [[MyButton alloc]initWithFrame:CGRectMake(162.5, 210, 60, 60)];
    _button7.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button7.tag = 7;
    [_button7 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button7];
    //按钮8
    _button8 = [[MyButton alloc]initWithFrame:CGRectMake(227.5, 210, 60, 60)];
    _button8.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button8.tag = 8;
    [_button8 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button8];
    
    //按钮9
    _button9 = [[MyButton alloc]initWithFrame:CGRectMake(32.5, 275, 60, 60)];
    _button9.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button9.tag = 9;
    [_button9 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button9];
    //按钮10
    _button10 = [[MyButton alloc]initWithFrame:CGRectMake(97.5, 275, 60, 60)];
    _button10.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button10.tag = 10;
    [_button10 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button10];
    //按钮11
    _button11 = [[MyButton alloc]initWithFrame:CGRectMake(162.5, 275, 60, 60)];
    _button11.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button11.tag = 11;
    [_button11 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button11];
    //按钮12
    _button12 = [[MyButton alloc]initWithFrame:CGRectMake(227.5, 275, 60, 60)];
    _button12.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button12.tag = 12;
    [_button12 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button12];

    //按钮13
    _button13 = [[MyButton alloc]initWithFrame:CGRectMake(32.5, 340, 60, 60)];
    _button13.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button13.tag = 13;
    [_button13 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button13];
    //按钮14
    _button14 = [[MyButton alloc]initWithFrame:CGRectMake(97.5, 340, 60, 60)];
    _button14.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button14.tag = 14;
    [_button14 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button14];
    //按钮15
    _button15 = [[MyButton alloc]initWithFrame:CGRectMake(162.5, 340, 60, 60)];
    _button15.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button15.tag = 15;
    [_button15 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button15];
    //按钮16
    _button16 = [[MyButton alloc]initWithFrame:CGRectMake(227.5, 340, 60, 60)];
    _button16.backgroundColor = [UIColor colorWithRed:193/255.0 green:179/255.0 blue:165/255.0 alpha:1];
    _button16.tag = 16;
    [_button16 addTarget:self action:@selector(ziDingYiAnJianXiangYing:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_button16];
    
    //玩法
    UILabel *wanFaLabel = [[UILabel alloc]initWithFrame:CGRectMake(27.5, 410, 265, 40)];
    //设置行数，默认是1，0为无数行
    wanFaLabel.numberOfLines = 0;
    //分行模式
    wanFaLabel.lineBreakMode = NSLineBreakByCharWrapping;
    wanFaLabel.textColor = [UIColor colorWithRed:173/255.0 green:158/255.0 blue:144/255.0 alpha:1];
    wanFaLabel.font = [UIFont systemFontOfSize:10];
    wanFaLabel.text = @"游戏规则：上、下、左、右滑动让单元格中的数字水平移动，最近的两个相同数字会合并并累加，加到2048算胜利。";
    //wanFaLabel.backgroundColor= [UIColor lightGrayColor];
    [self.window addSubview:wanFaLabel];
    
//View
//由于不能在按键上获取触摸点坐标，因此在整个界面加上一个view覆盖。
    UIView *bigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    //bigView.backgroundColor = [UIColor redColor];
    [self.window addSubview:bigView];
    
    //开始按钮:按钮要响应，因此添加到bigView上
    UIButton *xinYouXiButton = [UIButton buttonWithType:UIButtonTypeSystem];
    xinYouXiButton.frame = CGRectMake(140, 85, 70, 30);
    //xinYouXiButton.backgroundColor = [UIColor colorWithRed:235/255.0 green:223/255.0 blue:211/255.0 alpha:1];
    [xinYouXiButton setTitleColor:[UIColor colorWithRed:173/255.0 green:158/255.0 blue:144/255.0 alpha:1] forState:UIControlStateNormal];
    [xinYouXiButton setTitle:@"新游戏" forState:UIControlStateNormal];
    [xinYouXiButton addTarget:self action:@selector(xinYouXiXiangYing) forControlEvents:UIControlEventTouchUpInside];
    [bigView addSubview:xinYouXiButton];
    
    return YES;
}

-(void)xinYouXiXiangYing
{
    NSLog(@"新游戏响应");
    [self initGame];
    [self xianShi];
}
//不用按键响应
-(void)ziDingYiAnJianXiangYing:(MyButton *)aButton
{
    NSLog(@"自定义按键响应:%ld",(long)aButton.tag);
}

//触摸屏方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获取触摸点坐标
    //返回与当前接收者有关的所有的触摸对象
    NSSet *allTouches = [event allTouches];
    //视图中的所有对象
    UITouch *touch = [allTouches anyObject];
    //返回触摸点在视图中的当前坐标
    _beginPoint = [touch locationInView:[touch view]];
    NSLog(@"触屏开始(%d,%d)",(int)_beginPoint.x,(int)_beginPoint.y);
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//获取触摸点坐标
    //返回与当前接收者有关的所有的触摸对象
    NSSet *allTouches = [event allTouches];
    //视图中的所有对象
    UITouch *touch = [allTouches anyObject];
    //返回触摸点在视图中的当前坐标
    _endPoint = [touch locationInView:[touch view]];
    
    NSLog(@"触屏结束(%d,%d)",(int)_endPoint.x,(int)_endPoint.y);
    
//判断滑动方向
    //左右位差
    int xx = _beginPoint.x - _endPoint.x;
    //上下位差
    int yy = _beginPoint.y - _endPoint.y;
    
    //左右移动
    if(abs(xx) >  abs(yy))
    {
        //左移
        if(xx>0)
        {
            _direction = LEFT;
        }
        //右移
        else if(xx<0)
        {
            _direction = RIGHT;
        }
        //没有移动
        else
        {
            _direction = NOMOVE;
        }
    }
    //上下移动
    else if(abs(xx) <  abs(yy))
    {
        //上移
        if(yy > 0)
        {
            _direction = UP;
        }
        //下移
        else if(yy < 0)
        {
            _direction = DOWN;
        }
        //没有移动
        else
        {
            _direction = NOMOVE;
        }
    }
    //对角线移动.在这里把它当做没有移动。
    else
    {
        _direction = NOMOVE;
    }
    
    
//移动图片处理
    if(_direction == UP)
    {
        NSLog(@"向上");
        //获得移动前的，flag数据
        _mutableArray = [[NSMutableArray alloc]init];
        _mutableArray = [self saveFlag];
        
        //1  5  9  13
        NSMutableArray *muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button1.flag], [NSString stringWithFormat:@"%d",_button5.flag], [NSString stringWithFormat:@"%d",_button9.flag], [NSString stringWithFormat:@"%d",_button13.flag], nil];
        
        _button1.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button5.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button9.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button13.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //2  6  10  14
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button2.flag], [NSString stringWithFormat:@"%d",_button6.flag], [NSString stringWithFormat:@"%d",_button10.flag], [NSString stringWithFormat:@"%d",_button14.flag], nil];
        
        _button2.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button6.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button10.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button14.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //3  7  11  15
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button3.flag], [NSString stringWithFormat:@"%d",_button7.flag], [NSString stringWithFormat:@"%d",_button11.flag], [NSString stringWithFormat:@"%d",_button15.flag], nil];
        
        _button3.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button7.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button11.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button15.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //4  8  12  16
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button4.flag], [NSString stringWithFormat:@"%d",_button8.flag], [NSString stringWithFormat:@"%d",_button12.flag], [NSString stringWithFormat:@"%d",_button16.flag], nil];
        
        _button4.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button8.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button12.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button16.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //显示
        [self xianShi];
        ////判断输赢并随机数
        [self suiJiAndPanDuan];
    }
    else if(_direction == DOWN)
    {
        NSLog(@"向下");
        //获得移动前的，flag数据
        _mutableArray = [[NSMutableArray alloc]init];
        _mutableArray = [self saveFlag];
        
        //13  9  5  1
        NSMutableArray *muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button13.flag], [NSString stringWithFormat:@"%d",_button9.flag], [NSString stringWithFormat:@"%d",_button5.flag], [NSString stringWithFormat:@"%d",_button1.flag], nil];
        
        _button13.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button9.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button5.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button1.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //14  10  6  2
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button14.flag], [NSString stringWithFormat:@"%d",_button10.flag], [NSString stringWithFormat:@"%d",_button6.flag], [NSString stringWithFormat:@"%d",_button2.flag], nil];
        
        _button14.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button10.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button6.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button2.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //15  11  7  3
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button15.flag], [NSString stringWithFormat:@"%d",_button11.flag], [NSString stringWithFormat:@"%d",_button7.flag], [NSString stringWithFormat:@"%d",_button3.flag], nil];
        
        _button15.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button11.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button7.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button3.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //16  12  8  4
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button16.flag], [NSString stringWithFormat:@"%d",_button12.flag], [NSString stringWithFormat:@"%d",_button8.flag], [NSString stringWithFormat:@"%d",_button4.flag], nil];
        
        _button16.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button12.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button8.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button4.flag = [[[self move:muArray] objectAtIndex:3] intValue];

        //显示
        [self xianShi];
        ////判断输赢并随机数
        [self suiJiAndPanDuan];
    }
    else if(_direction == LEFT)
    {
        NSLog(@"向左");
        //获得移动前的，flag数据
        _mutableArray = [[NSMutableArray alloc]init];
        _mutableArray = [self saveFlag];
        
        //1  2  3  4
        NSMutableArray *muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button1.flag], [NSString stringWithFormat:@"%d",_button2.flag], [NSString stringWithFormat:@"%d",_button3.flag], [NSString stringWithFormat:@"%d",_button4.flag], nil];
        
        _button1.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button2.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button3.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button4.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //5  6  7  8
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button5.flag], [NSString stringWithFormat:@"%d",_button6.flag], [NSString stringWithFormat:@"%d",_button7.flag], [NSString stringWithFormat:@"%d",_button8.flag], nil];
        
        _button5.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button6.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button7.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button8.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //9  10  11  12
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button9.flag], [NSString stringWithFormat:@"%d",_button10.flag], [NSString stringWithFormat:@"%d",_button11.flag], [NSString stringWithFormat:@"%d",_button12.flag], nil];
        
        _button9.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button10.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button11.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button12.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //13  14  15  16
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button13.flag], [NSString stringWithFormat:@"%d",_button14.flag], [NSString stringWithFormat:@"%d",_button15.flag], [NSString stringWithFormat:@"%d",_button16.flag], nil];
        
        _button13.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button14.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button15.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button16.flag = [[[self move:muArray] objectAtIndex:3] intValue];

        //显示
        [self xianShi];
        ////判断输赢并随机数
        [self suiJiAndPanDuan];

    }
    else if(_direction == RIGHT)
    {
        NSLog(@"向右");
        //获得移动前的，flag数据
        _mutableArray = [[NSMutableArray alloc]init];
        _mutableArray = [self saveFlag];
        
        //4  3  2  1
        NSMutableArray *muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button4.flag], [NSString stringWithFormat:@"%d",_button3.flag], [NSString stringWithFormat:@"%d",_button2.flag], [NSString stringWithFormat:@"%d",_button1.flag], nil];
        
        _button4.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button3.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button2.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button1.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //8  7  6  5
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button8.flag], [NSString stringWithFormat:@"%d",_button7.flag], [NSString stringWithFormat:@"%d",_button6.flag], [NSString stringWithFormat:@"%d",_button5.flag], nil];
        
        _button8.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button7.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button6.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button5.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //12  11  10  9
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button12.flag], [NSString stringWithFormat:@"%d",_button11.flag], [NSString stringWithFormat:@"%d",_button10.flag], [NSString stringWithFormat:@"%d",_button9.flag], nil];
        
        _button12.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button11.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button10.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button9.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //16  15  14  13
        muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button16.flag], [NSString stringWithFormat:@"%d",_button15.flag], [NSString stringWithFormat:@"%d",_button14.flag], [NSString stringWithFormat:@"%d",_button13.flag], nil];
        
        _button16.flag = [[[self move:muArray] objectAtIndex:0] intValue];
        _button15.flag = [[[self move:muArray] objectAtIndex:1] intValue];
        _button14.flag = [[[self move:muArray] objectAtIndex:2] intValue];
        _button13.flag = [[[self move:muArray] objectAtIndex:3] intValue];
        
        //显示
        [self xianShi];
        ////判断输赢并随机数
        [self suiJiAndPanDuan];
    }
    else
    {
        NSLog(@"不移动");
    }
}

-(void)initGame
{
    //初始化界面
    _button1.flag = 0;
    _button2.flag = 2;
    _button3.flag = 0;
    _button4.flag = 0;
    _button5.flag = 0;
    _button6.flag = 0;
    _button7.flag = 0;
    _button8.flag = 2;
    _button9.flag = 0;
    _button10.flag = 0;
    _button11.flag = 0;
    _button12.flag = 2;
    _button13.flag = 0;
    _button14.flag = 0;
    _button15.flag = 0;
    _button16.flag = 0;
    
    //初始化数据缓存
    _fenShuZhi = 0;
    
    //显示界面
    [self xianShi];
}
-(void)xianShi
{
    NSLog(@"显示函数");
    //显示界面
    [_button1 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button1.flag]] forState:UIControlStateNormal];
    [_button2 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button2.flag]] forState:UIControlStateNormal];
    [_button3 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button3.flag]] forState:UIControlStateNormal];
    [_button4 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button4.flag]] forState:UIControlStateNormal];
    [_button5 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button5.flag]] forState:UIControlStateNormal];
    [_button6 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button6.flag]] forState:UIControlStateNormal];
    [_button7 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button7.flag]] forState:UIControlStateNormal];
    [_button8 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button8.flag]] forState:UIControlStateNormal];
    [_button9 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button9.flag]] forState:UIControlStateNormal];
    [_button10 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button10.flag]] forState:UIControlStateNormal];
    [_button11 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button11.flag]] forState:UIControlStateNormal];
    [_button12 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button12.flag]] forState:UIControlStateNormal];
    [_button13 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button13.flag]] forState:UIControlStateNormal];
    [_button14 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button14.flag]] forState:UIControlStateNormal];
    [_button15 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button15.flag]] forState:UIControlStateNormal];
    [_button16 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_button16.flag]] forState:UIControlStateNormal];
    
    //显示计分
    _fenShu.text = [NSString stringWithFormat:@"%d",_fenShuZhi];
    _zuiGaoFenShu.text = [NSString stringWithFormat:@"%d",_zuiGaoFenShuZhi];
}
//图片移动方法
-(NSMutableArray *)move:(NSMutableArray *)aMuArray
{
    //获得数组中的数
    int flag1 = [[aMuArray objectAtIndex:0] intValue];
    int flag2 = [[aMuArray objectAtIndex:1] intValue];
    int flag3 = [[aMuArray objectAtIndex:2] intValue];
    int flag4 = [[aMuArray objectAtIndex:3] intValue];
    
    //判断0的个数
    int cnt = 0;
    if(flag1 == 0) cnt ++;
    if(flag2 == 0) cnt ++;
    if(flag3 == 0) cnt ++;
    if(flag4 == 0) cnt ++;
    switch (cnt)
    {
            //0个零
        case 0:
            if(flag1 == flag2)
            {
                flag1 = flag1 + flag2;
                flag2 = flag3;
                flag3 = flag4;
                flag4 = 0;
                
                //计分
                [self jiFen:flag1];
            }
            
            if(flag2 == flag3)
            {
                flag1 = flag1;
                flag2 = flag2 + flag3;
                flag3 = flag4;
                flag4 = 0;
                
                //计分
                [self jiFen:flag2];
            }
            
            if(flag3 == flag4)
            {
                flag1 = flag1;
                flag2 = flag2;
                flag3 = flag3 + flag4;
                flag4 = 0;
                
                //计分
                [self jiFen:flag3];
            }
            break;
            //1个零
        case 1:
            //第一个数是0
            if(flag1 == 0)
            {
                if(flag2 == flag3)
                {
                    flag1 = flag2 + flag3;
                    flag2 = flag4;
                    flag3 = 0;
                    flag4 = 0;
                    
                    //计分
                    [self jiFen:flag2];
                }
                else if(flag3 == flag4)
                {
                    flag1 = flag2;
                    flag2 = flag3 + flag4;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag3];
                }
                else
                {
                    flag1 = flag2;
                    flag2 = flag3;
                    flag3 = flag4;
                    flag4 = 0;
                }
                
            }
            //第二个数是0
            else if(flag2 == 0)
            {
                if(flag1 == flag3)
                {
                    flag1 = flag1 + flag3;
                    flag2 = flag4;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag1];
                }
                else if(flag3 == flag4)
                {
                    flag1 = flag1;
                    flag2 = flag3 + flag4;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag3];
                }
                else
                {
                    flag1 = flag1;
                    flag2 = flag3;
                    flag3 = flag4;
                    flag4 = 0;
                }
            }
            //第三个数是0
            else if(flag3 == 0)
            {
                if(flag1 == flag2)
                {
                    flag1 = flag1 + flag2;
                    flag2 = flag4;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag1];
                }
                else if(flag2 == flag4)
                {
                    flag1 = flag1;
                    flag2 = flag2 + flag4;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag2];
                }
                else
                {
                    flag1 = flag1;
                    flag2 = flag2;
                    flag3 = flag4;
                    flag4 = 0;
                }
            }
            //第四个数是0
            else if(flag4 == 0)
            {
                if(flag1 == flag2)
                {
                    flag1 = flag1 + flag2;
                    flag2 = flag3;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag1];
                }
                else if(flag2 == flag3)
                {
                    flag1 = flag1;
                    flag2 = flag2 + flag3;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag2];
                }
                else
                {
                    flag1 = flag1;
                    flag2 = flag2;
                    flag3 = flag3;
                    flag4 = 0;
                }
            }
            break;
            //2个零
        case 2:
            if(flag1 == 0 && flag2 == 0)
            {
                if(flag3 == flag4)
                {
                    flag1 = flag3 + flag4;
                    flag2 = 0;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag3];
                }
                else
                {
                    flag1 = flag3;
                    flag2 = flag4;
                    flag3 = 0;
                    flag4 = 0;
                }
            }
            if(flag2 == 0 && flag3 == 0)
            {
                if(flag1 == flag4)
                {
                    flag1 = flag1 + flag4;
                    flag2 = 0;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag1];
                }
                else
                {
                    flag1 = flag1;
                    flag2 = flag4;
                    flag3 = 0;
                    flag4 = 0;
                }
            }
            if(flag3 == 0 && flag4 == 0)
            {
                if(flag1 == flag2)
                {
                    flag1 = flag1 + flag2;
                    flag2 = 0;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag1];
                }
                else
                {
                    flag1 = flag1;
                    flag2 = flag2;
                    flag3 = 0;
                    flag4 = 0;
                }
            }
            if(flag1 == 0 && flag3 == 0)
            {
                if(flag2 == flag4)
                {
                    flag1 = flag2 + flag4;
                    flag2 = 0;
                    //计分
                    [self jiFen:flag2];
                }
                else
                {
                    flag1 = flag2;
                    flag2 = flag4;
                    flag3 = 0;
                    flag4 = 0;
                }
            }
            if(flag2 == 0 && flag4 == 0)
            {
                if(flag1 == flag3)
                {
                    flag1 = flag1 + flag3;
                    flag2 = 0;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag1];
                }
                else
                {
                    flag1 = flag1;
                    flag2 = flag3;
                    flag3 = 0;
                    flag4 = 0;
                }
            }
            if(flag1 == 0 && flag4 == 0)
            {
                if(flag2 == flag3)
                {
                    flag1 = flag2 + flag3;
                    flag2 = 0;
                    flag3 = 0;
                    flag4 = 0;
                    //计分
                    [self jiFen:flag2];
                }
                else
                {
                    flag1 = flag2;
                    flag2 = flag3;
                    flag3 = 0;
                    flag4 = 0;
                }
            }
            
            break;
            //3个零
        case 3:
            if(flag2 !=0)
            {
                flag1 = flag2;
                flag2 = 0;
            }
            if(flag3 !=0)
            {
                flag1 = flag3;
                flag3 = 0;
            }
            if(flag4 !=0)
            {
                flag1 = flag4;
                flag4 = 0;
            }
            
            break;
            //4个零,不用处理
        case 4: break;
            
        default:break;
    }
    
    //定义数组，存储数据
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",flag1], [NSString stringWithFormat:@"%d",flag2], [NSString stringWithFormat:@"%d",flag3], [NSString stringWithFormat:@"%d",flag4], nil];
    //返回数组
    return array;
}

-(void)suiJiAndPanDuan
{
    //判断输赢并随机数
    if( (_button1.flag == 2048) || (_button2.flag == 2048) || (_button3.flag == 2048) || (_button4.flag == 2048)
       || (_button5.flag == 2048) || (_button6.flag == 2048) || (_button7.flag == 2048) || (_button8.flag == 2048)
       || (_button9.flag == 2048) || (_button10.flag == 2048) || (_button11.flag == 2048) || (_button12.flag == 2048)
       || (_button13.flag == 2048) || (_button14.flag == 2048) || (_button15.flag == 2048) || (_button16.flag == 2048))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"恭喜你，拼出2048！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
        //初始化游戏
        [self initGame];
    }
    else if((_button1.flag != 0) && (_button2.flag != 0) && (_button3.flag != 0) && (_button4.flag != 0)
            && (_button5.flag != 0) && (_button6.flag != 0) && (_button7.flag != 0) && (_button8.flag != 0)
            && (_button9.flag != 0) && (_button10.flag != 0) && (_button11.flag != 0) && (_button12.flag != 0)
            && (_button13.flag != 0) && (_button14.flag != 0) && (_button15.flag != 0) && (_button16.flag != 0)&&([self kePinPanDuan] == NO))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"闯关失败，再来一次吧" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
        //初始化游戏
        [self initGame];
        
    }
    else
    {
        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        tempArray = [self saveFlag];
        
        //判断是否应该生成随机数字
        if([self arrayIsEqualOne:_mutableArray two:tempArray] == NO)
        {
        //生成随机数
        [self makeRand];
        //显示
        [self daYinFlag] ;
        
        }
    }
}
-(void)jiFen:(int)flag
{
    //计分
    _fenShuZhi = _fenShuZhi + flag;
    if(_fenShuZhi > _zuiGaoFenShuZhi)
    {
        _zuiGaoFenShuZhi = _fenShuZhi;
    }
    _fenShu.text = [NSString stringWithFormat:@"%d",_fenShuZhi/4];
    _zuiGaoFenShu.text = [NSString stringWithFormat:@"%d",_zuiGaoFenShuZhi/4];
}
-(BOOL)directionKePinPanDuan:(NSMutableArray *)aMuArray
{
    //某个方向是否有模块可以合并判断
    BOOL value = NO;
    
    //获得数组中的数
    int flag1 = [[aMuArray objectAtIndex:0] intValue];
    int flag2 = [[aMuArray objectAtIndex:1] intValue];
    int flag3 = [[aMuArray objectAtIndex:2] intValue];
    int flag4 = [[aMuArray objectAtIndex:3] intValue];
    
    //判断0的个数
    int cnt = 0;
    if(flag1 == 0) cnt ++;
    if(flag2 == 0) cnt ++;
    if(flag3 == 0) cnt ++;
    if(flag4 == 0) cnt ++;
    switch (cnt)
    {
            //0个零
        case 0:
            if(flag1 == flag2)
            {
                value = YES;
            }
            
            if(flag2 == flag3)
            {
                value = YES;
            }
            
            if(flag3 == flag4)
            {
                value = YES;
            }
            break;
            //1个零
        case 1:
            //第一个数是0
            if(flag1 == 0)
            {
                if(flag2 == flag3)
                {
                    value = YES;
                }
                else if(flag3 == flag4)
                {
                    value = YES;
                }
                else
                {

                }
                
            }
            //第二个数是0
            else if(flag2 == 0)
            {
                if(flag1 == flag3)
                {
                    value = YES;
                }
                else if(flag3 == flag4)
                {
                     value = YES;
                }
                else
                {

                }
            }
            //第三个数是0
            else if(flag3 == 0)
            {
                if(flag1 == flag2)
                {
                    value = YES;
                }
                else if(flag2 == flag4)
                {
                    value = YES;
                }
                else
                {

                }
            }
            //第四个数是0
            else if(flag4 == 0)
            {
                if(flag1 == flag2)
                {
                    value = YES;
                }
                else if(flag2 == flag3)
                {
                    value = YES;
                }
                else
                {

                }
            }
            break;
            //2个零
        case 2:
            if(flag1 == 0 && flag2 == 0)
            {
                if(flag3 == flag4)
                {
                    value = YES;
                }
                else
                {

                }
            }
            if(flag2 == 0 && flag3 == 0)
            {
                if(flag1 == flag4)
                {
                    value = YES;
                }
                else
                {

                }
            }
            if(flag3 == 0 && flag4 == 0)
            {
                if(flag1 == flag2)
                {
                    value = YES;
                }
                else
                {

                }
            }
            if(flag1 == 0 && flag3 == 0)
            {
                if(flag2 == flag4)
                {
                    value = YES;
                }
                else
                {

                }
            }
            if(flag2 == 0 && flag4 == 0)
            {
                if(flag1 == flag3)
                {
                    value = YES;
                }
                else
                {

                }
            }
            if(flag1 == 0 && flag4 == 0)
            {
                if(flag2 == flag3)
                {
                    value = YES;
                }
                else
                {

                }
            }

            break;
            //3个零
        case 3:
            if(flag2 !=0)
            {

            }
            if(flag3 !=0)
            {

            }
            if(flag4 !=0)
            {

            }
            
            break;
            //4个零,不用处理
        case 4: break;
            
        default:break;
    }

    return value;
}

-(BOOL)kePinPanDuan
{
    //整个程序是否有可拼判断
    BOOL value;
    //向上判断
    //1  5  9  13
    NSMutableArray *muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button1.flag], [NSString stringWithFormat:@"%d",_button5.flag], [NSString stringWithFormat:@"%d",_button9.flag], [NSString stringWithFormat:@"%d",_button13.flag], nil];
    BOOL value1 = [self directionKePinPanDuan:muArray];
    
    //2  6  10  14
    muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button2.flag], [NSString stringWithFormat:@"%d",_button6.flag], [NSString stringWithFormat:@"%d",_button10.flag], [NSString stringWithFormat:@"%d",_button14.flag], nil];
    
    BOOL value2 = [self directionKePinPanDuan:muArray];
    
    //3  7  11  15
    muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button3.flag], [NSString stringWithFormat:@"%d",_button7.flag], [NSString stringWithFormat:@"%d",_button11.flag], [NSString stringWithFormat:@"%d",_button15.flag], nil];
    
    BOOL value3 = [self directionKePinPanDuan:muArray];
    
    //4  8  12  16
    muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button4.flag], [NSString stringWithFormat:@"%d",_button8.flag], [NSString stringWithFormat:@"%d",_button12.flag], [NSString stringWithFormat:@"%d",_button16.flag], nil];
    
    BOOL value4 = [self directionKePinPanDuan:muArray];
    
    
    //向左判断
    //1  2  3  4
    muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button1.flag], [NSString stringWithFormat:@"%d",_button2.flag], [NSString stringWithFormat:@"%d",_button3.flag], [NSString stringWithFormat:@"%d",_button4.flag], nil];
    
    BOOL value5 = [self directionKePinPanDuan:muArray];
    
    //5  6  7  8
    muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button5.flag], [NSString stringWithFormat:@"%d",_button6.flag], [NSString stringWithFormat:@"%d",_button7.flag], [NSString stringWithFormat:@"%d",_button8.flag], nil];
    
    BOOL value6 = [self directionKePinPanDuan:muArray];
    
    //9  10  11  12
    muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button9.flag], [NSString stringWithFormat:@"%d",_button10.flag], [NSString stringWithFormat:@"%d",_button11.flag], [NSString stringWithFormat:@"%d",_button12.flag], nil];
    
    BOOL value7 = [self directionKePinPanDuan:muArray];
    
    //13  14  15  16
    muArray = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%d",_button13.flag], [NSString stringWithFormat:@"%d",_button14.flag], [NSString stringWithFormat:@"%d",_button15.flag], [NSString stringWithFormat:@"%d",_button16.flag], nil];
    
    BOOL value8 = [self directionKePinPanDuan:muArray];
    
    value = value1 || value2 || value3 || value4 || value5 || value6 || value7 ||value8;

    return value;
}

-(void)makeRand
{
    //生成随机的2或4
    BOOL judge = NO;
    while(judge == NO)
    {
        int randButtonFlag = arc4random()%16 + 1;
        int randNum = (arc4random()%4)?2:4;
        
        switch (randButtonFlag)
        {
            case 1:if(_button1.flag == 0) {_button1.flag = randNum;judge = YES;} break;
            case 2:if(_button2.flag == 0) {_button2.flag = randNum;judge = YES;} break;
            case 3:if(_button3.flag == 0) {_button3.flag = randNum;judge = YES;} break;
            case 4:if(_button4.flag == 0) {_button4.flag = randNum;judge = YES;} break;
            case 5:if(_button5.flag == 0) {_button5.flag = randNum;judge = YES;} break;
            case 6:if(_button6.flag == 0) {_button6.flag = randNum;judge = YES;} break;
            case 7:if(_button7.flag == 0) {_button7.flag = randNum;judge = YES;} break;
            case 8:if(_button8.flag == 0) {_button8.flag = randNum;judge = YES;} break;
            case 9:if(_button9.flag == 0) {_button9.flag = randNum;judge = YES;} break;
            case 10:if(_button10.flag == 0) {_button10.flag = randNum;judge = YES;} break;
            case 11:if(_button11.flag == 0) {_button11.flag = randNum;judge = YES;} break;
            case 12:if(_button12.flag == 0) {_button12.flag = randNum;judge = YES;} break;
            case 13:if(_button13.flag == 0) {_button13.flag = randNum;judge = YES;} break;
            case 14:if(_button14.flag == 0) {_button14.flag = randNum;judge = YES;} break;
            case 15:if(_button15.flag == 0) {_button15.flag = randNum;judge = YES;} break;
            case 16:if(_button16.flag == 0) {_button16.flag = randNum;judge = YES;} break;
            default:break;
        }
        
        NSLog(@"随机：%d===%d===%d===",randButtonFlag,randNum,judge);
    }
    //显示
    [self xianShi];
}
-(NSMutableArray *)saveFlag
{
    //把_button1.flag到_button1.flag存储到可变数组中
    NSMutableArray *muArray = [[NSMutableArray alloc]init];
    for(int i = 0; i < 16; i++)
    {
        MyButton *button = (MyButton *)[self.window viewWithTag:i+1];
        [muArray addObject:[NSString stringWithFormat:@"%d",button.flag]];
    }
    
    return muArray;
}
-(BOOL)arrayIsEqualOne:(NSMutableArray *)oneArray two:(NSMutableArray *)twoArray
{
    //判断两个可变数组是否相同
    BOOL value = YES;
    for(int i = 0; i < 16; i ++)
    {
        if([[oneArray objectAtIndex:i] isEqualToString:[twoArray objectAtIndex:i]] == NO)
        {
            value = NO;
        }
    }
   return value;
}

-(void)daYinFlag
{
    //只是在命令控制行显示
    printf("\n");
    for(int i = 0; i < 16; i ++)
    {
        printf("%8d",[[[self saveFlag] objectAtIndex:i] intValue]);
        if((i+1)%4 == 0)
        {
            printf("\n");
        }
    }
}
@end

