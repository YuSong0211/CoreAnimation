//
//  ViewController.m
//  twitter启动动画
//
//  Created by  椒徒科技 on 2017/5/26.
//  Copyright © 2017年 jiaotukeji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView * photoImage;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    //设置UIWindow颜色
    [UIApplication sharedApplication].keyWindow.backgroundColor = [UIColor colorWithRed:128.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
    
    UIView *bacgroundView = [[UIView alloc] initWithFrame:self.navigationController.view.layer.frame];
    bacgroundView.backgroundColor = [UIColor whiteColor];
    [self.navigationController.view addSubview:bacgroundView];
    [self.navigationController.view bringSubviewToFront:bacgroundView];
    
    //设置mask
    CALayer *maskLayer = [CALayer layer];
    maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"logo"].CGImage);
    maskLayer.position = self.view.center;
    maskLayer.bounds = CGRectMake(0, 0, 60, 60);
    self.navigationController.view.layer.mask = maskLayer;
    
    //添加帧动画
    CAKeyframeAnimation *keyAnimataion = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    //    keyAnimataion.delegate = self;
    keyAnimataion.duration = 1.0f;
    keyAnimataion.beginTime = CACurrentMediaTime() + 1;
    
    CGRect initBounds = self.navigationController.view.layer.mask.bounds;
    CGRect secondBounds = CGRectMake(0, 0, 50, 50);
    CGRect finalBounds = CGRectMake(0, 0, 2000, 2000);
    keyAnimataion.values = @[[NSValue valueWithCGRect:initBounds],[NSValue valueWithCGRect:secondBounds],[NSValue valueWithCGRect:finalBounds]];
    keyAnimataion.keyTimes = @[@0,@0.5,@1];
    keyAnimataion.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    keyAnimataion.removedOnCompletion = false;
    keyAnimataion.fillMode = kCAFillModeForwards;
    
    [self.navigationController.view.layer.mask addAnimation:keyAnimataion forKey:@"logoKeyAnimation"];
    
    [UIView animateWithDuration:0.25 delay:1.3 options:UIViewAnimationOptionTransitionNone animations:^{
        bacgroundView.alpha = 0;
    } completion:^(BOOL finsihed){
        [bacgroundView removeFromSuperview];
    }];
    
    [UIView animateWithDuration:0.25 delay:1.3 options:UIViewAnimationOptionTransitionNone  animations:^{
        self.navigationController.view.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.navigationController.view.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];

}



@end
