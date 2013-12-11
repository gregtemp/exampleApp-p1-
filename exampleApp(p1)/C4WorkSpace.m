//
//  C4WorkSpace.m
//  exampleApp(p1)
//
//  Created by Gregory Debicki on 2013-12-09.
//

#import "C4Workspace.h"
#import "imageFilterScrollView.h"
#import "Example.h"

@implementation C4WorkSpace {
    Example *example;
    C4View *exampleView;
    C4ScrollView *menu;
}

-(void)setup {
    
    menu = [C4ScrollView scrollView:CGRectMake(0, 0, self.canvas.width, self.canvas.height)];
    menu.alpha = 0.0f;
    menu.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.02f];
    [self.canvas addSubview:menu];
    menu.animationDuration = 0.5f;
    menu.animationOptions = EASEINOUT;
    [self displayMenu];
    
    [self listenFor:@"removeExample" fromObject:exampleView andRunMethod:@"removeExampleFromCanvas:"];
}

//-(void) touchesBegan {
//    [self addExampleNamed:@"colorBlend"];
//}

-(void) displayMenu {
    menu.alpha = 1.0f;
    menu.userInteractionEnabled = YES;
    
    NSInteger spacing = 30.0f;
    CGPoint centerPoint = CGPointMake(self.canvas.width/2, self.canvas.height/4);
    C4Label *additionComposite = [self menuItemWithName:@"additionComposite"];
    additionComposite.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *colorBlend = [self menuItemWithName:@"colorBlend"];
    colorBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *colorBurn = [self menuItemWithName:@"colorBurn"];
    colorBurn.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *colorControlSaturation = [self menuItemWithName:@"colorControlSaturation"];
    colorControlSaturation.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *colorInvert = [self menuItemWithName:@"colorInvert"];
    colorInvert.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *colorMatrix = [self menuItemWithName:@"colorMatrix"];
    colorMatrix.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *darkenBlend = [self menuItemWithName:@"darkenBlend"];
    darkenBlend.center = centerPoint;
    centerPoint.y += spacing;
    
    C4Label *differenceBlend = [self menuItemWithName:@"differenceBlend"];
    differenceBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *exclusionBlend = [self menuItemWithName:@"exclusionBlend"];
    exclusionBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *exposureAdjust = [self menuItemWithName:@"exposureAdjust"];
    exposureAdjust.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *gammaAdjustment = [self menuItemWithName:@"gammaAdjustment"];
    gammaAdjustment.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *hardLightBlend = [self menuItemWithName:@"hardLightBlend"];
    hardLightBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *highlightShadowAdjust = [self menuItemWithName:@"highlightShadowAdjust"];
    highlightShadowAdjust.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *hueAdjust = [self menuItemWithName:@"hueAdjust"];
    hueAdjust.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *hueBlend = [self menuItemWithName:@"hueBlend"];
    hueBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *lightenBlend = [self menuItemWithName:@"lightenBlend"];
    lightenBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *luminosityBlend = [self menuItemWithName:@"luminosityBlend"];
    luminosityBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *maximumComposite = [self menuItemWithName:@"maximumComposite"];
    maximumComposite.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *minimumComposite = [self menuItemWithName:@"minimumComposite"];
    minimumComposite.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *multiplyBlend = [self menuItemWithName:@"multiplyBlend"];
    multiplyBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *multiplyComposite = [self menuItemWithName:@"multiplyComposite"];
    multiplyComposite.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *overlayBlend = [self menuItemWithName:@"overlayBlend"];
    overlayBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *saturationBlend = [self menuItemWithName:@"saturationBlend"];
    saturationBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *screenBlend = [self menuItemWithName:@"screenBlend"];
    screenBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *sepiaTone = [self menuItemWithName:@"sepiaTone"];
    sepiaTone.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *softLightBlend = [self menuItemWithName:@"softLightBlend"];
    softLightBlend.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *straighten = [self menuItemWithName:@"straighten"];
    straighten.center = centerPoint;
    centerPoint.y += spacing;
    C4Label *temperatureAndTint = [self menuItemWithName:@"temperatureAndTint"];
    temperatureAndTint.center = centerPoint;
    centerPoint.y += spacing;
    
    menu.contentSize = CGSizeMake(self.canvas.width, centerPoint.y + 100);
    [menu addObjects:@[additionComposite,
                       colorBlend,
                       colorBurn,
                       colorControlSaturation,
                       colorInvert,
                       colorMatrix,
                       darkenBlend,
                       differenceBlend,
                       exclusionBlend,
                       exposureAdjust,
                       gammaAdjustment,
                       hardLightBlend,
                       highlightShadowAdjust,
                       hueAdjust,
                       hueBlend,
                       lightenBlend,
                       luminosityBlend,
                       maximumComposite,
                       minimumComposite,
                       multiplyBlend,
                       multiplyComposite,
                       overlayBlend,
                       saturationBlend,
                       screenBlend,
                       sepiaTone,
                       softLightBlend,
                       straighten,
                       temperatureAndTint]];
     
}

-(C4Label *)menuItemWithName: (NSString *)name {
    C4Font *f = [C4Font fontWithName:@"Helvetica" size:20.0f];
    C4Label *menuItem = [C4Label labelWithText:name font:f];
    [self listenFor:@"touchesBegan" fromObject:menuItem andRunMethod:@"addExampleNamed:"];
    menuItem.textColor = C4BLUE;
    return menuItem;
}

-(void) removeExampleFromCanvas: (NSNotification *)notification{
    C4Log(@"touched");
    Example *theExample = (Example *)notification.object;
    C4View *theExampleView = (C4View *)theExample.canvas;
    [self removeObject:theExampleView];
    menu.alpha = 1.0f;
    menu.userInteractionEnabled = YES;
}

-(void) addExampleNamed: (NSNotification *)notification {
    C4Label *menuItem = (C4Label *)notification.object;
    NSString *exampleName = menuItem.text;
    menu.alpha = 0.0f;
    menu.userInteractionEnabled = NO;
    [self runMethod:@"openExample:" withObject:exampleName afterDelay:0.5f];
}

-(void) openExample: (NSString *)exampleName {
    example = [[Example alloc] initWithNibName:@"Example" bundle:[NSBundle mainBundle]];
    [example setupWithName:exampleName];
    exampleView = (C4View *)example.canvas;
    [self.canvas addSubview:exampleView];
}


@end
