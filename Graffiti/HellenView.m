//
//  HellenView.m
//  Graffiti
//
//  Created by bottle on 15-4-27.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "HellenView.h"

@interface HellenView()

@property (nonatomic,strong) NSMutableArray *paths;


@end

@implementation HellenView


- (NSMutableArray *)paths {
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //获得当前点
    NSLog(@"touchesBegan");
    UITouch *touch = [touches anyObject];
    CGPoint curPos = [touch locationInView:touch.view];
    
    //创建一个新的路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:curPos];
    
    [self.paths addObject:path];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");

    //
    UITouch *touch = [touches anyObject];
    CGPoint curPos = [touch locationInView:touch.view];
    
    //
    UIBezierPath *path = [self.paths lastObject];
    [path addLineToPoint:curPos];
    
    [self setNeedsDisplay];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] set];
    for (UIBezierPath *path in self.paths) {
        path.lineWidth = 5;
        [path stroke];
    }
}

- (void)back {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

- (void)clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)save {
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    //将view的layer渲染到当前上下文
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    //取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    //保存图片
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}
@end
