//
//  Card.m
//  Practice1
//
//  Created by Hansen on 2/27/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) Match: (Card *)aCard {
    if ([aCard.contents isEqualToString:_contents]) {
        return 1;
    } else {
        return 0;
    }
}
@end
