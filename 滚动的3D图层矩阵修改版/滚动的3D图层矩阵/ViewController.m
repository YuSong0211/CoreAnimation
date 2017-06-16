//
//  ViewController.m
//  滚动的3D图层矩阵
//
//  Created by  椒徒科技 on 2017/6/14.
//  Copyright © 2017年 jiaotukeji. All rights reserved.
//

#import "ViewController.h"
#define WIDTH 10
#define HEIGHT 10
#define DEPTH 10
#define SIZE 100
#define SPACING 150
#define CAMERA_DISTANCE 500
#define PERSPECTIVE(z) (float)CAMERA_DISTANCE/(z + CAMERA_DISTANCE)

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set content size
    self.scrollView.contentSize = CGSizeMake((WIDTH - 1)*SPACING, (HEIGHT - 1)*SPACING);
    self.scrollView.delegate = self;
    //set up perspective transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / CAMERA_DISTANCE;
    
}

- (void)viewDidLayoutSubviews
{
    
    [super viewDidLayoutSubviews];
    [self updateLayers];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updateLayers];
}
- (void)updateLayers {
    //    calculate clipping bounds
    CGRect bounds = self.scrollView.bounds;
    bounds.origin = self.scrollView.contentOffset;
    bounds = CGRectInset(bounds, -SIZE/2, -SIZE/2);
    

    //create layers
    NSInteger recycled = 0;
    NSMutableArray *visibleLayers = [NSMutableArray array];
    for (int z = DEPTH - 1; z >= 0; z--)
    {
        
        CGRect adjusted = bounds;
        adjusted.size.width /= PERSPECTIVE(z*SPACING);
        adjusted.size.height /= PERSPECTIVE(z*SPACING);
        adjusted.origin.x -= (adjusted.size.width - bounds.size.width) / 2;
        adjusted.origin.y -= (adjusted.size.height - bounds.size.height) / 2;

        for (int y = 0; y < HEIGHT; y++) {
            //check if vertically outside visible rect
            if (y*SPACING < adjusted.origin.y ||
                y*SPACING >= adjusted.origin.y + adjusted.size.height)
            {
                continue;
            }
            for (int x = 0; x < WIDTH; x++) {
                //check if horizontally outside visible rect
                if (x*SPACING < adjusted.origin.x ||
                    x*SPACING >= adjusted.origin.x + adjusted.size.width)
                {
                    continue;
                }

                CALayer *  layer = [CALayer layer];
                layer.frame = CGRectMake(0, 0, SIZE, SIZE);
                //set position
                layer.position = CGPointMake(x*SPACING, y*SPACING);
                layer.zPosition = -z*SPACING;
                //set background color
                layer.backgroundColor =
                [UIColor colorWithWhite:1-z*(1.0/DEPTH) alpha:1].CGColor;
                //attach to scroll view
                [visibleLayers addObject:layer];
                
            }
        }
    }
    self.scrollView.layer.sublayers = visibleLayers;
    
    //log
    NSLog(@"displayed: %lu/%i recycled: %li",
          (unsigned long)[visibleLayers count], DEPTH*HEIGHT*WIDTH, (long)recycled);
}
//- (void)updateLayers
//{
//    //calculate clipping bounds
//    CGRect bounds = self.scrollView.bounds;
//    bounds.origin = self.scrollView.contentOffset;
//    bounds = CGRectInset(bounds, -SIZE/2, -SIZE/2);
//    //create layers
//    NSMutableArray *visibleLayers = [NSMutableArray array];
//    for (int z = DEPTH - 1; z >= 0; z--)
//    {
//        //increase bounds size to compensate for perspective
//        CGRect adjusted = bounds;
//        adjusted.size.width /= PERSPECTIVE(z*SPACING);
//        adjusted.size.height /= PERSPECTIVE(z*SPACING);
//        adjusted.origin.x -= (adjusted.size.width - bounds.size.width) / 2;
//        adjusted.origin.y -= (adjusted.size.height - bounds.size.height) / 2;
//        for (int y = 0; y < HEIGHT; y++) {
//            //check if vertically outside visible rect
//            if (y*SPACING < adjusted.origin.y || y*SPACING >= adjusted.origin.y + adjusted.size.height)
//            {
//                continue;
//            }
//            for (int x = 0; x < WIDTH; x++) {
//                //check if horizontally outside visible rect
//                if (x*SPACING < adjusted.origin.x ||x*SPACING >= adjusted.origin.x + adjusted.size.width)
//                {
//                    continue;
//                }
//                
//                //create layer
//                CALayer *layer = [CALayer layer];
//                layer.frame = CGRectMake(0, 0, SIZE,SIZE);
//                layer.position = CGPointMake(x*SPACING, y*SPACING);
//                layer.zPosition = -z*SPACING;
//                //set background color
//                layer.backgroundColor = [UIColor colorWithWhite:1-z*(1.0/DEPTH) alpha:1].CGColor;
//                //attach to scroll view
//                [visibleLayers addObject:layer];
//            }
//        }
//    }
//    //update layers
//    self.scrollView.layer.sublayers = visibleLayers;
//    //log
//    NSLog(@"displayed: %lu/%i", (unsigned long)[visibleLayers count], DEPTH*HEIGHT*WIDTH);
//}
@end


                                         
                                         
                                         
                                         
                                         
                                         
                                         
                                         
                                         
