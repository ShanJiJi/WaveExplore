//
//  ViewController.m
//  解读波浪动画
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "ViewController.h"
#import "LYWaveView.h"

@interface ViewController ()

@property (nonatomic,strong) LYWaveView *waveView;

//显示y=Asin(ax+b)+h
@property (weak, nonatomic) IBOutlet UILabel *exmpleLabel;

//波浪高度
@property (weak, nonatomic) IBOutlet UILabel *waveHeight;
//波浪速度
@property (weak, nonatomic) IBOutlet UILabel *waveSpeed;
//波浪增幅
@property (weak, nonatomic) IBOutlet UILabel *waveIncrease;
//波浪的周率
@property (weak, nonatomic) IBOutlet UILabel *wavePeriod;

@property (weak, nonatomic) IBOutlet UISlider *slider_waveHeight;
@property (weak, nonatomic) IBOutlet UISlider *slider_waveSpeed;
@property (weak, nonatomic) IBOutlet UISlider *slider_waveIncrease;
@property (weak, nonatomic) IBOutlet UISlider *slider_wavePeriod;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.waveView = [[LYWaveView alloc]initWithFrame:self.view.bounds];
    [self.view insertSubview:self.waveView atIndex:0];
    
    
    self.waveHeight.text = [NSString stringWithFormat:@"waveHeight   %.2f",_slider_waveHeight.value*self.view.bounds.size.height];
    
    self.waveSpeed.text = [NSString stringWithFormat:@"waveSpeed   %.2f",_slider_waveSpeed.value];

    self.waveIncrease.text = [NSString stringWithFormat:@"waveIncrease   %.2f",_slider_waveIncrease.value];
    
    self.wavePeriod.text = [NSString stringWithFormat:@"wavePeriod   %.2f",_slider_wavePeriod.value];
}

- (IBAction)event_waveHeight:(UISlider *)sender {
    self.waveHeight.text = [NSString stringWithFormat:@"waveHeight   %.2f",_slider_waveHeight.value*self.view.bounds.size.height];
    self.waveView.h = self.view.bounds.size.height - _slider_waveHeight.value*self.view.bounds.size.height;
    self.exmpleLabel.text = [NSString stringWithFormat:@"y=%.1fsin(%.1fx+%.1f)+%.1f",self.waveView.A,self.waveView.w,self.waveView.speed,self.waveView.h];
}

- (IBAction)event_waveSpeed:(UISlider *)sender {
    self.waveSpeed.text = [NSString stringWithFormat:@"waveSpeed   %.2f",_slider_waveSpeed.value];
    self.waveView.speed = _slider_waveSpeed.value;
    self.exmpleLabel.text = [NSString stringWithFormat:@"y=%.1fsin(%.1fx+%.1f)+%.1f",self.waveView.A,self.waveView.w,self.waveView.speed,self.waveView.h];
}

- (IBAction)event_waveIncrease:(UISlider *)sender {
    self.waveIncrease.text = [NSString stringWithFormat:@"waveIncrease   %.2f",_slider_waveIncrease.value*100];
    self.waveView.A = _slider_waveIncrease.value*100;
    self.exmpleLabel.text = [NSString stringWithFormat:@"y=%.1fsin(%.1fx+%.1f)+%.1f",self.waveView.A,self.waveView.w,self.waveView.speed,self.waveView.h];
}

- (IBAction)event_wavePeriod:(UISlider *)sender {
    self.wavePeriod.text = [NSString stringWithFormat:@"wavePeriod   %.2f",_slider_wavePeriod.value];
    self.waveView.w = _slider_wavePeriod.value*10;
    self.exmpleLabel.text = [NSString stringWithFormat:@"y=%.1fsin(%.1fx+%.1f)+%.1f",self.waveView.A,self.waveView.w,self.waveView.speed,self.waveView.h];

}

@end
