//
//  CardDeck.h
//  BlackJack
//
//  Created by Yachao Liu on 7/28/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardDeck : NSObject
{
    NSMutableArray *deck;
}

@property (retain, nonatomic) NSMutableArray *deck;

- (void) shuffleDeck;
- (void) swapCards: (int) p1 pos2: (int) p2;
- (Card*) dealCard;

@end
