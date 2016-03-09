//
//  ViewController.m
//  Time
//
//  Created by 刘浩浩 on 16/1/22.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    NSTimer *_timer;
}

@property(nonatomic,strong)UIImageView *timeImageView;
@property(nonatomic,strong)UIImageView *secondImageView;
@property(nonatomic,strong)UIImageView *minuteImageView;
@property(nonatomic,strong)UIImageView *hourImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _timeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 842/2, 595/2)];
    _timeImageView.userInteractionEnabled=YES;
    UIImage *timeImage=[UIImage imageNamed:@"time.png"];
    _timeImageView.image=timeImage;
    [self.view.layer addSublayer:_timeImageView.layer];
    
    _secondImageView=[[UIImageView alloc]initWithFrame:CGRectMake(160-50, 568/2-50, 100, 100)];
    _secondImageView.userInteractionEnabled=YES;
    UIImage *secondImage=[UIImage imageNamed:@"second.png"];
    _secondImageView.image=secondImage;
    [self.view addSubview:_secondImageView];

    _minuteImageView=[[UIImageView alloc]initWithFrame:CGRectMake(160-35, 568/2-35, 70, 70)];
    _minuteImageView.userInteractionEnabled=YES;
    UIImage *minuteImage=[UIImage imageNamed:@"minute.png"];
    _minuteImageView.image=minuteImage;
    [self.view addSubview:_minuteImageView];
    
    _hourImageView=[[UIImageView alloc]initWithFrame:CGRectMake(160-20, 568/2-20, 40, 40)];
    _hourImageView.userInteractionEnabled=YES;
    UIImage *hourImage=[UIImage imageNamed:@"minute.png"];
    _hourImageView.image=hourImage;
    [self.view addSubview:_hourImageView];
    
    _timeImageView.center=self.view.center;
//    _secondImageView.center=self.view.center;
//    _minuteImageView.center=self.view.center;
//    _hourImageView.center=self.view.center;
    
    _secondImageView.layer.anchorPoint=CGPointMake(0.5, 0.9);
    _hourImageView.layer.anchorPoint=CGPointMake(0.5, 0.7);
    _minuteImageView.layer.anchorPoint=CGPointMake(0.5, 0.7);
    
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
    [self timeFire];

    [_timer fire];
}
-(void)timeFire
{
    //定义一个遵循某个历法的日历对象
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    float hoursAngle=(dateComponents.hour%12*1.0/12)*M_PI*2+dateComponents.minute*1.0/60.0*(M_PI/6);
    float minutesAngle=(dateComponents.minute*1.0/60)*M_PI*2;
    float secondsAngle=(dateComponents.second*1.0/60)*M_PI*2;
    
    _hourImageView.transform=CGAffineTransformMakeRotation(hoursAngle);
    _minuteImageView.transform=CGAffineTransformMakeRotation(minutesAngle);
    _secondImageView.transform=CGAffineTransformMakeRotation(secondsAngle);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
