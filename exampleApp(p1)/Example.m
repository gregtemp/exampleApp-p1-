//
//  Example.m
//  exampleApp(p1)
//
//  Created by Gregory Debicki on 2013-12-09.
//  Copyright (c) 2013 Greg Debicki. All rights reserved.
//

#import "Example.h"
#import "imageFilterScrollView.h"

@implementation Example {
    C4ScrollView *theView;
}

-(void)setupWithName: (NSString *)exampleName {
    self.canvas.backgroundColor = [UIColor clearColor];
    theView = nil;
    theView = [imageFilterScrollView exampleNamed:exampleName withSize:CGSizeMake(self.canvas.width, self.canvas.height)];
    theView.origin = CGPointMake(0, 0);
    [self.canvas addSubview:theView];
    theView.alpha = 0.0f;
    theView.animationDuration = 0.5f;
    theView.alpha = 1.0f;
    
    C4Shape *backButton = [self backButtonWithOrigin:CGPointMake(2, self.canvas.height - 36)];
    backButton.zPosition = 100;
    [self.canvas addShape:backButton];
    [self listenFor:@"touchesBegan" fromObject:backButton andRunMethod:@"backTouch"];
}

-(void) backTouch {
    theView.alpha = 0.0f;
    [self runMethod:@"gone" afterDelay:0.6f];
}

-(void) gone {
    [self postNotification:@"removeExample"];
}

-(C4Shape *)backButtonWithOrigin: (CGPoint)originPoint {
    CGPoint points[3] = {
        CGPointMake(0, 0),
        CGPointMake(15, 10),
        CGPointMake(0, 20) };
    C4Shape *arrow = [C4Shape polygon:points pointCount:3];
    arrow.fillColor = [UIColor clearColor];
    arrow.lineWidth = 2.0f;
    arrow.rotation = PI;
    arrow.alpha = 0.5f;
    arrow.userInteractionEnabled = NO;
    C4Shape *arrowTouchArea = [C4Shape ellipse:CGRectMake(0, 0, 33, 33)];
    arrow.center = CGPointMake(arrowTouchArea.width/2, arrowTouchArea.height/2);
    arrowTouchArea.fillColor = [UIColor clearColor];
    arrowTouchArea.strokeColor = [UIColor clearColor];
    arrowTouchArea.origin = originPoint;
    [arrowTouchArea addShape:arrow];
    arrowTouchArea.zPosition = 100;
    return arrowTouchArea;
}




@end
