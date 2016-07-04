//
//  LYWaveView.m
//  解读波浪动画
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 雷晏. All rights reserved.
//
//y=Asin（ωx+φ）+h
#import "LYWaveView.h"

@interface LYWaveView()
{
    CADisplayLink *link;
    CGFloat b;
}
@end

@implementation LYWaveView


-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        self.speed = 0;
        self.h = frame.size.height;
        self.A = 0;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    b+= self.speed;
    //获得当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGContextSetLineWidth(contextRef, 1);
    UIColor * blue = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3];
    CGContextSetFillColorWithColor(contextRef, blue.CGColor);
    
    //计算
    CGFloat startY = self.h;
    CGPathMoveToPoint(pathRef, NULL, 0, startY);
    
    for(CGFloat i = 0.0 ; i < rect.size.width ; i++){
        CGFloat wx = self.w*i/180*M_PI;
        CGFloat y = self.A * sinf(wx+b) + self.h;
        CGPathAddLineToPoint(pathRef, NULL, i, y);
    }
    CGPathAddLineToPoint(pathRef, nil, rect.size.width , rect.size.height );
    CGPathAddLineToPoint(pathRef, nil, 0, rect.size.height );
    CGContextAddPath(contextRef, pathRef);
    CGContextFillPath(contextRef);
    CGContextDrawPath(contextRef, kCGPathStroke);
    CGPathRelease(pathRef);

}

-(void)createTimer{
    if(!link){
        link = [CADisplayLink displayLinkWithTarget:self selector:@selector(startAnimation)];
        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

-(void)destroyTimer{
    [link invalidate];
    link = nil;
}
-(void)startAnimation{
    [self setNeedsDisplay];
}
-(void)setH:(CGFloat)h{
    _h = h;
    [self createTimer];
}
-(void)setA:(CGFloat)A{
    _A = A;
    [self createTimer];
}
-(void)setSpeed:(CGFloat)speed{
    _speed = speed;
    [self createTimer];
}
-(void)setW:(CGFloat)w{
    _w = w;
    [self createTimer];
}
@end
