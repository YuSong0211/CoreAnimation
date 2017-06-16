//
//  ViewController.m
//  contentsCenter
//
//  Created by  椒徒科技 on 2017/6/12.
//  Copyright © 2017年 jiaotukeji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>

@property (nonatomic, weak) IBOutlet UIView *button1;
@property (nonatomic, weak) IBOutlet UIView *button2;

@end

@implementation ViewController

- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
    //set contentsCenter”
      layer.contentsCenter = rect;
}

- (void)viewDidLoad
{
    [super viewDidLoad]; //load button image
    UIImage *image = [UIImage imageNamed:@"Ship.png"];
    
    //set button 1
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button1.layer];
    
    //set button 2
    [self addStretchableImage:image withContentCenter:CGRectMake(0, 0, 1, 1) toLayer:self.button2.layer];
    
    
    
    

    //create layer
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50, 50, 100, 100);
//    blueLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.0, 0.0);
//    blueLayer.contentsScale = [UIScreen mainScreen].scale;
//    blueLayer.contents = (__bridge id)[UIImage imageNamed:@"Ship.png"].CGImage;
//    //add it to our view
//    [self.button1.layer addSublayer:blueLayer];
    
    
    //enable layer shadows
//    self.button1.layer.shadowOpacity = 0.5f;
//    self.button2.layer.shadowOpacity = 0.5f;
//    
//    //create a square shadow
//    CGMutablePathRef squarePath = CGPathCreateMutable();
//    CGPathAddRect(squarePath, NULL, self.button1.bounds);
//    self.button1.layer.shadowPath = squarePath;
//    CGPathRelease(squarePath);
//    
//    //create a circular shadow
//    CGMutablePathRef circlePath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(circlePath, NULL, self.button2.bounds);
//    self.button2.layer.shadowPath = circlePath;
//    CGPathRelease(circlePath);


    
    //create sublayer
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    
//    //set controller as layer delegate
//    blueLayer.delegate = self;
//    
//    //ensure that layer backing image uses correct scale
//    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
//    [self.button1.layer addSublayer:blueLayer];
//    
//    //force layer to redraw
//    [blueLayer display];
    
   
}



- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}


@end
