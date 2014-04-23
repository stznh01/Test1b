//
//  PlayingCardView.m
//  Practice2
//
//  Created by Hansen on 2/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
/*
#define DEFAULT_FACE_CARD_FACTOR 0.9

- (CGFloat) faceCardScaleFactor {
    if (!_faceCardScaleFactor) {
        _faceCardScaleFactor = DEFAULT_FACE_CARD_FACTOR;
    }
    return _faceCardScaleFactor;
}

- (void) setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor {
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}
 */

- (void) setRank:(NSUInteger)rank {
    _rank = rank;
    [self setNeedsDisplay];
}
- (void) setSuit:(NSString *)suit {
    _suit = suit;
    [self setNeedsDisplay];
}
- (void) setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}
- (CGFloat) cornerScaleFactor {
    return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT;
}
- (CGFloat) cornerRadius {
    return [self cornerScaleFactor] * CORNER_RADIUS;
}
- (CGFloat) cornerOffset {
    return [self cornerRadius]/3.0;
    // Prof say "times", but code uploaded is division???
    // As tested, only division works correctly
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    [roundRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    [[UIColor blackColor] setStroke];
    [roundRect stroke];
    
    [self drawCorners];
    
}
- (void) setup {
    [self setBackgroundColor:nil];
    [self setOpaque:NO];
    [self setContentMode:UIViewContentModeRedraw];
}
- (void) awakeFromNib {
    [self setup];
}
- (void) drawCorners {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    // Used aid from Prof for above line of code: would not know pointSize otherwise
    NSString *cornerString = [NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit];
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:cornerString attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName:paragraphStyle}];
    CGRect textBounds;
    textBounds.size = [cornerText size];
    //Used Prof's solution for the line above
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    [cornerText drawInRect:textBounds];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(ctx, M_PI);
    [cornerText drawInRect:textBounds];

}
- (NSString *) rankAsString {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][_rank];
}


@end
