//
//  PaintCodeTutorial.m
//  PaintCodeTutorial
//
//  Created by hongyu_zhao on 16/9/4.
//  Copyright (c) 2016 hongyu_zhao. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "PaintCodeTutorial.h"


@implementation PaintCodeTutorial

#pragma mark Cache

static UIColor* _baseColor = nil;

static UIImage* _imageOfStopwatch = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _baseColor = [UIColor colorWithRed: 0.067 green: 0.553 blue: 0.855 alpha: 1];

}

#pragma mark Colors

+ (UIColor*)baseColor { return _baseColor; }

#pragma mark Drawing Methods

+ (void)drawStopwatch
{

    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(15, 25, 220, 220)];
    [PaintCodeTutorial.baseColor setFill];
    [ovalPath fill];


    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(114, 2, 22, 34)];
    [PaintCodeTutorial.baseColor setFill];
    [rectanglePath fill];


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(221.14, 30)];
    [bezierPath addLineToPoint: CGPointMake(242.36, 51.22)];
    [bezierPath addLineToPoint: CGPointMake(228.21, 65.36)];
    [bezierPath addCurveToPoint: CGPointMake(223, 60.15) controlPoint1: CGPointMake(228.21, 65.36) controlPoint2: CGPointMake(226, 63.14)];
    [bezierPath addCurveToPoint: CGPointMake(223, 60.36) controlPoint1: CGPointMake(223, 60.28) controlPoint2: CGPointMake(223, 60.36)];
    [bezierPath addLineToPoint: CGPointMake(212, 60.36)];
    [bezierPath addLineToPoint: CGPointMake(212, 49.36)];
    [bezierPath addLineToPoint: CGPointMake(212.21, 49.36)];
    [bezierPath addCurveToPoint: CGPointMake(207, 44.14) controlPoint1: CGPointMake(209.21, 46.36) controlPoint2: CGPointMake(207, 44.14)];
    [bezierPath addLineToPoint: CGPointMake(221.14, 30)];
    [bezierPath closePath];
    [PaintCodeTutorial.baseColor setFill];
    [bezierPath fill];
}

+ (void)drawStopWatch_Hand
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Bezier 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 125, 137);

    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(4, -87)];
    [bezier2Path addCurveToPoint: CGPointMake(4, -15.46) controlPoint1: CGPointMake(4, -87) controlPoint2: CGPointMake(4, -48.03)];
    [bezier2Path addCurveToPoint: CGPointMake(15, -1) controlPoint1: CGPointMake(10.34, -13.71) controlPoint2: CGPointMake(15, -7.9)];
    [bezier2Path addCurveToPoint: CGPointMake(4, 13.46) controlPoint1: CGPointMake(15, 5.9) controlPoint2: CGPointMake(10.34, 11.71)];
    [bezier2Path addCurveToPoint: CGPointMake(4, 28) controlPoint1: CGPointMake(4, 22.31) controlPoint2: CGPointMake(4, 28)];
    [bezier2Path addLineToPoint: CGPointMake(-4, 28)];
    [bezier2Path addCurveToPoint: CGPointMake(-4, 13.46) controlPoint1: CGPointMake(-4, 28) controlPoint2: CGPointMake(-4, 22.31)];
    [bezier2Path addCurveToPoint: CGPointMake(-15, -1) controlPoint1: CGPointMake(-10.34, 11.71) controlPoint2: CGPointMake(-15, 5.9)];
    [bezier2Path addCurveToPoint: CGPointMake(-4, -15.46) controlPoint1: CGPointMake(-15, -7.9) controlPoint2: CGPointMake(-10.34, -13.71)];
    [bezier2Path addCurveToPoint: CGPointMake(-4, -87) controlPoint1: CGPointMake(-4, -48.03) controlPoint2: CGPointMake(-4, -87)];
    [bezier2Path addLineToPoint: CGPointMake(4, -87)];
    [bezier2Path addLineToPoint: CGPointMake(4, -87)];
    [bezier2Path closePath];
    [UIColor.whiteColor setFill];
    [bezier2Path fill];

    CGContextRestoreGState(context);
}

#pragma mark Generated Images

+ (UIImage*)imageOfStopwatch
{
    if (_imageOfStopwatch)
        return _imageOfStopwatch;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(250, 250), NO, 0.0f);
    [PaintCodeTutorial drawStopwatch];

    _imageOfStopwatch = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfStopwatch;
}

#pragma mark Customization Infrastructure

- (void)setStopwatchTargets: (NSArray*)stopwatchTargets
{
    _stopwatchTargets = stopwatchTargets;

    for (id target in self.stopwatchTargets)
        [target performSelector: @selector(setImage:) withObject: PaintCodeTutorial.imageOfStopwatch];
}


@end
