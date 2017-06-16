//
//  DrawingView.m
//  DrawingView
//
//  Created by  椒徒科技 on 2017/6/12.
//  Copyright © 2017年 jiaotukeji. All rights reserved.
//

#import "DrawingView.h"
#define BRUSH_SIZE 32
@interface DrawingView ()

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) NSMutableArray *strokes;

@end

@implementation DrawingView

- (void)awakeFromNib
{
    [super awakeFromNib];

   self.strokes = [NSMutableArray array];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add brush stroke
    [self addBrushStrokeAtPoint:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add brush stroke
//    [self addBrushStrokeAtPoint:point];
    
    
     //add brush stroke to array
    [self.strokes addObject:[NSValue valueWithCGPoint:point]];
    
    //set dirty rect
    [self setNeedsDisplayInRect:[self brushRectForPoint:point]];


}

- (CGRect)brushRectForPoint:(CGPoint)point
{
    return CGRectMake(point.x - BRUSH_SIZE/2, point.y - BRUSH_SIZE/2, BRUSH_SIZE, BRUSH_SIZE);
}


- (void)addBrushStrokeAtPoint:(CGPoint)point
{
    //add brush stroke to array
    [self.strokes addObject:[NSValue valueWithCGPoint:point]];
    
    //needs redraw
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    //redraw strokes
    for (NSValue *value in self.strokes) {
        //get point
        CGPoint point = [value CGPointValue];
        
        //get brush rect
        CGRect brushRect = [self brushRectForPoint:point];
        
        //only draw brush stroke if it intersects dirty rect
        if (CGRectIntersectsRect(rect, brushRect)) {
            //draw brush stroke”
        [[UIImage imageNamed:@"Door.png"] drawInRect:brushRect];
        }
    }
}

//- (void)drawRect:(CGRect)rect
//{
//    //redraw strokes
//    for (NSValue *value in self.strokes) {
//        //get point
//        CGPoint point = [value CGPointValue];
//        
//        //get brush rect
//        CGRect brushRect = CGRectMake(point.x - BRUSH_SIZE/2, point.y - BRUSH_SIZE/2, BRUSH_SIZE, BRUSH_SIZE);
//        
//        //draw brush stroke    ￼
//        [[UIImage imageNamed:@"Door.png"] drawInRect:brushRect];
//    }
//}




/*
 
 Core Animation
 */

//- (void)awakeFromNib
//{
//    //create a mutable path
//    self.path = [[UIBezierPath alloc] init];
//    
//    //configure the layer
//    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
//
//    
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.lineJoin = kCALineJoinRound;
//    shapeLayer.lineCap = kCALineCapRound;
//    shapeLayer.lineWidth = 5;
//}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get the starting point
//    CGPoint point = [[touches anyObject] locationInView:self];
//    
//    //move the path drawing cursor to the starting point
//    [self.path moveToPoint:point];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get the current point
//    CGPoint point = [[touches anyObject] locationInView:self];
//    
//    //add a new line segment to our path
//    [self.path addLineToPoint:point];
//    
//    //update the layer with a copy of the path
//    ((CAShapeLayer *)self.layer).path = self.path.CGPath;
//}



/*
 Core Graphics
 */

//- (void)awakeFromNib
//{
//    //create a mutable path
//    self.path = [[UIBezierPath alloc] init];
//    self.path.lineJoinStyle = kCGLineJoinRound;
//    self.path.lineCapStyle = kCGLineCapRound;
//    
//    self.path.lineWidth = 5;
//}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get the starting point
//    CGPoint point = [[touches anyObject] locationInView:self];
//    
//    //move the path drawing cursor to the starting point
//    [self.path moveToPoint:point];
//}
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get the current point
//    CGPoint point = [[touches anyObject] locationInView:self];
//    
//    //add a new line segment to our path
//    [self.path addLineToPoint:point];
//    
//    //redraw the view
//    [self setNeedsDisplay];
//}
//
//- (void)drawRect:(CGRect)rect
//{
//    //draw path
//    [[UIColor clearColor] setFill];
//    [[UIColor redColor] setStroke];
//    [self.path stroke];
//}


@end
