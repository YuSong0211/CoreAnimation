//
//  ViewController.m
//  圆圈进度条
//
//  Created by  椒徒科技 on 2017/5/31.
//  Copyright © 2017年 jiaotukeji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController{
   BOOL animating;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UIView * _demoView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_demoView];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = _demoView.bounds;
//    shapeLayer.strokeEnd = 0.7f;
//    shapeLayer.strokeStart = 0.1f;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:_demoView.bounds];
    
    shapeLayer.path = path.CGPath;
    
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    [_demoView.layer addSublayer:shapeLayer];
    
    CABasicAnimation * anima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    anima.fromValue = @(0);
    anima.toValue   = @(1);
    anima.duration = 4;
    
//    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    shapeLayer.strokeEnd = 0.0f;
    
    [shapeLayer addAnimation:anima forKey:@""];
}

////      originframe = self.frame;
//    
//    
//    if (animating == YES) {
//        return;
//    }
//    
//    for (CALayer *subLayer in self.layer.sublayers) {
//        [subLayer removeFromSuperlayer];
//    }
//    
//    self.backgroundColor = [UIColor colorWithRed:0.0 green:122/255.0 blue:255/255.0 alpha:1.0];
//    
//    animating = YES;
//    
//    
//    self.layer.cornerRadius = self.progressBarHeight/2;
//    CABasicAnimation *radiusAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
//    radiusAnimation.duration = 0.2f;
//    radiusAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    radiusAnimation.fromValue = @(originframe.size.height/2);
//    
//    radiusAnimation.delegate = self;
//    
//    
//     [self.layer addAnimation:radiusAnimation forKey:@"cornerRadiusShrinkAnim"];
//}
//
//-(void)animationDidStart:(CAAnimation *)anim{
//    
//    
//    if ([anim isEqual:[self.layer animationForKey:@"cornerRadiusShrinkAnim"]]) {
//        
//        [UIView animateWithDuration:0.6f delay:0.0f usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//            self.bounds = CGRectMake(0, 0, _progressBarWidth, _progressBarHeight);
//        } completion:^(BOOL finished) {
//            [self.layer removeAllAnimations];
//            [self progressBarAnimation];
//        }];
//        
//    }
//}
//    
//-(void)progressBarAnimation{
//    
//        CAShapeLayer *progressLayer = [CAShapeLayer layer];
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(_progressBarHeight/2, self.bounds.size.height/2)];
//        [path addLineToPoint:CGPointMake(self.bounds.size.width-_progressBarHeight/2, self.bounds.size.height/2)];
//        
//        progressLayer.path = path.CGPath;
//        progressLayer.strokeColor = [UIColor whiteColor].CGColor;
//        progressLayer.lineWidth = _progressBarHeight-6;
//        progressLayer.lineCap = kCALineCapRound;
//        
//        [self.layer addSublayer:progressLayer];
//        
//        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//        pathAnimation.duration = 2.0f;
//        pathAnimation.fromValue = @(0.0f);
//        pathAnimation.toValue = @(1.0f);
//        pathAnimation.delegate = self;
//        [pathAnimation setValue:@"progressBarAnimation" forKey:@"animationName"];
//        [progressLayer addAnimation:pathAnimation forKey:nil];
//        
//    }
//    





@end
