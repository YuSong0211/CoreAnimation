//
//  ViewController.m
//  缓冲
//
//  Created by  椒徒科技 on 2017/6/8.
//  Copyright © 2017年 jiaotukeji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create a red layer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //configure the transaction
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//    //set the position
//    self.colorLayer.position = [[touches anyObject] locationInView:self.view];
//    //commit transaction
//    [CATransaction commit];
    
     [UIView animateWithDuration:1.0 delay:0.0
            options:UIViewAnimationOptionCurveEaseOut
        animations:^{
            //set the position
            self.colorLayer.position = [[touches anyObject] locationInView:self.view];
        }
        completion:NULL];
            
}





@end
