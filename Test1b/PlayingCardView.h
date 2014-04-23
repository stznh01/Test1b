//
//  PlayingCardView.h
//  Practice2
//
//  Created by Hansen on 2/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
// Only NSString can be strong because the other two variables are not stored on heap (right?)
@property (nonatomic) BOOL faceUp;

#define CORNER_FONT_STANDARD_HEIGHT 180.0;
#define CORNER_RADIUS 12.0;

@end
