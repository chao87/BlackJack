//
//  Player.m
//  BlackJack
//
//  Created by Yachao Liu on 8/4/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize name, hand;

- (int) handTotal
{
    int total = 0;
    
    for (int i = 0; i < [hand count]; i++) {
        if([[hand objectAtIndex:i] cardRank] > 10)
        {
            total += 10;
        }
        else
        {
            total += [[hand objectAtIndex:i] cardRank];
        }
    }
    
    return total;
}

- (void) addCardToHand:(Card *)c
{
    [hand addObject:c];
}

- (void) clearHand
{
    [hand removeAllObjects];
}

- (id)init
{
    self = [super init];
    if (self) {
        name = @"NO_NAME_PLAYER";
        hand = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (Player *) initWithName:(NSString *)pName
{
    self = [super init];
    if (self) {
        name = pName;
        hand = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
