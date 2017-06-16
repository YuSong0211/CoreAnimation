//
//  ViewController.m
//  layer
//
//  Created by  椒徒科技 on 2017/6/2.
//  Copyright © 2017年 jiaotukeji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *button;
@property (weak, nonatomic) IBOutlet UIView *button2;

@property (nonatomic, weak) IBOutlet UIView *containerView;
@property (nonatomic, weak) IBOutlet UIView *layerView1;
@property (nonatomic, weak) IBOutlet UIView *layerView2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //apply perspective transform to container
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    self.containerView.layer.sublayerTransform = perspective;
    //rotate layerView1 by 45 degrees along the Y axis
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView1.layer.transform = transform1;
    //rotate layerView2 by 45 degrees along the Y axis
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform2;
}

//
//     CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//      self.button2.layer.affineTransform = transform;
//       self.button.transform = transform;
    
-(void)CATransform3D{
    CATransform3D transform = CATransform3DIdentity;
    //apply perspective
    transform.m34 = - 1.0 / 1000.0;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
//    transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.button.layer.transform = transform;
    
    
//    self.button.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Button.png"].CGImage);


//        //create sublayer
//        CALayer *blueLayer = [CALayer layer];
//        blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
////        blueLayer.contentsRect = CGRectMake(0.25, 0.25, 0.5, 0.5);
//        blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//        
//        //set controller as layer delegate
//        blueLayer.delegate = self;
//        
//        //ensure that layer backing image uses correct scale
//        blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
//        [self.button2.layer addSublayer:blueLayer];
//    
//        
//        //force layer to redraw
//        [blueLayer display];
    
    [self contercer];
    }
    
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
    {
        //draw a thick red circle
        CGContextSetLineWidth(ctx, 10.0f);
        CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
        CGContextStrokeEllipseInRect(ctx, layer.bounds);
    }

    


-(void)contercer{

    UIImage *image = [UIImage imageNamed:@"Button.png"];
    
    //set button 1
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button.layer];
    
    //set button 2
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button2.layer];
}
- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
    //set contentsCenter
    layer.contentsCenter = rect;
}

@end
