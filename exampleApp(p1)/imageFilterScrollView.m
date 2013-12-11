//
//  imageFilterScrollView.m
//  exampleApp(p1)
//
//  Created by Gregory Debicki on 2013-12-09.
//  Copyright (c) 2013 Greg Debicki. All rights reserved.
//

#import "imageFilterScrollView.h"

@implementation imageFilterScrollView {
    
}

+(C4ScrollView *)exampleNamed: (NSString *)exampleName withSize: (CGSize)viewSize {
    C4ScrollView *mainView = [C4ScrollView scrollView:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    mainView.contentSize = CGSizeMake(viewSize.width, viewSize.height*2.0f);
    mainView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.02f];
    NSString* textPath = [[NSBundle mainBundle] pathForResource:exampleName
                                                         ofType:@"txt"];
    NSString* textContent = [NSString stringWithContentsOfFile:textPath
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
    
    
    C4Font *headingFont = [C4Font fontWithName:@"Helvetica" size:20.0f];
    C4Label *heading = [C4Label labelWithText:@"" font:headingFont frame:CGRectMake(20, 0, viewSize.width - 40, 300)];
    heading.numberOfLines = 10.0f;
    heading.text = exampleName;
    heading.text = [heading.text stringByAppendingString:@" Filter"];
    heading.textAlignment = ALIGNTEXTCENTER;
    heading.textColor = C4BLUE;
    [heading sizeToFit];
    heading.center = CGPointMake(viewSize.width/2, viewSize.height/4);
    heading.userInteractionEnabled = NO;
    
    C4Font *bodyFont = [C4Font fontWithName:@"Helvetica" size:14.0f];
    C4Label *introText = [C4Label labelWithText:@"" font:bodyFont frame:CGRectMake(20, 0, viewSize.width - 40, 300)];
    introText.numberOfLines = 10.0f;
    
    introText.text = [textContent substringToIndex:NSMaxRange([textContent rangeOfString:@"[intro]"])-7];
    [introText sizeToFit];
    introText.origin = CGPointMake(20, heading.origin.y + heading.size.height + 70);
    introText.userInteractionEnabled = NO;
    
    NSString *imageName = [NSString stringWithFormat:@"%@.png", exampleName];
    C4Image *img = [C4Image imageNamed:imageName];
    if (!img) {
        img = [C4Image imageNamed:@"switchOff"];
    }
    else img.width = viewSize.width*2.0;
    img.origin = CGPointMake(0, introText.origin.y + introText.size.height + 20);
    img.center = CGPointMake(viewSize.width/2, img.center.y);
    img.userInteractionEnabled = NO;
    
    C4Label *bodyText = [C4Label labelWithText:@"" font:bodyFont frame:CGRectMake(20, 0, viewSize.width - 40, 300)];
    bodyText.numberOfLines = 50.0f;
    
    NSString *bodySubstring = [textContent substringFromIndex:NSMaxRange([textContent rangeOfString:@"[intro]"])];
    bodyText.text = [bodySubstring substringToIndex:NSMaxRange([bodySubstring rangeOfString:@"[body]"])-6];
    
    [bodyText sizeToFit];
    bodyText.origin = CGPointMake(20, img.origin.y + img.size.height);
    bodyText.userInteractionEnabled = NO;
    
    C4Font *codeFont = [C4Font fontWithName:@"Helvetica" size:12.0f];
    C4Label *codeText = [C4Label labelWithText:@"" font:codeFont frame:CGRectMake(20, 0, viewSize.width - 40, 300)];
    codeText.numberOfLines = 10.0f;
    
    NSString *codeSubstring = [textContent substringFromIndex:NSMaxRange([textContent rangeOfString:@"[body]"])];
    codeText.text = [codeSubstring substringToIndex:NSMaxRange([codeSubstring rangeOfString:@"[code]"])-6];
    
    codeText.textAlignment = ALIGNTEXTCENTER;
    codeText.numberOfLines = 10.0f;
    codeText.textColor = C4BLUE;
    [codeText sizeToFit];
    codeText.center = CGPointMake(viewSize.width/2, bodyText.origin.y + bodyText.size.height + 20);
    codeText.userInteractionEnabled = NO;
    
    mainView.contentSize = CGSizeMake(viewSize.width, codeText.origin.y + codeText.height + 100);
    
    if ([textContent rangeOfString:@"[tip]"].location != NSNotFound) {
        C4Label *tipText = [C4Label labelWithText:@"" font:codeFont frame:CGRectMake(20, 0, viewSize.width - 40, 300)];
        tipText.numberOfLines = 50.0f;
        
        NSString *tipSubstring = [textContent substringFromIndex:NSMaxRange([textContent rangeOfString:@"[code]"])];
        tipText.text = [tipSubstring substringToIndex:NSMaxRange([tipSubstring rangeOfString:@"[tip]"])-5];
        
        [tipText sizeToFit];
        tipText.origin = CGPointMake(20, codeText.origin.y + codeText.size.height + 40);
        tipText.userInteractionEnabled = NO;
        
        [mainView addLabel:tipText];
        mainView.contentSize = CGSizeMake(viewSize.width, tipText.origin.y + tipText.height + 100);
    }
    
    [mainView addObjects:@[heading, introText, bodyText, codeText, img]];
    return mainView;
}

@end
