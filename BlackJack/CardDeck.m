//
//  CardDeck.m
//  BlackJack
//
//  Created by Yachao Liu on 7/28/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import "CardDeck.h"

@implementation CardDeck

@synthesize deck;

- (id)init
{
    self = [super init];
    if (self) {
        deck = [[NSMutableArray alloc] init];
        for (int s = DIAMOND; s <= SPADE; s++) {
            for (int r = ONE; r <= KING; r++) {
                Card *tempCard = [[Card alloc] initWithRankAndSuit:r suit:s];
                
                NSMutableString *image = [[NSMutableString alloc] init];
                [image appendString:[tempCard convertRankToString:r]];
                [image appendString:@"_"];
                [image appendString:[tempCard convertSuitToString:s]];
                [image appendString:@".png"];                 
                
                tempCard.imageURL = image;
                
                [deck addObject:tempCard];
            }
        }
        
        
    }
    
    return self;
}

- (void) shuffleDeck
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < [deck count]; j++) {
            int num = (arc4random() % ([deck count] - j));
            
            if(j != num)
            {
                [self swapCards:j pos2:num];
            }
        }
    }
        
}

- (void) swapCards:(int)p1 pos2:(int)p2
{
    Card *card1 = [deck objectAtIndex:p1];
    Card *card2 = [deck objectAtIndex:p2];
    Card *tempCard = card1;
    
    [deck replaceObjectAtIndex:p1 withObject:card2];
    [deck replaceObjectAtIndex:p2 withObject:tempCard];
}

- (Card*) dealCard
{
    Card *cardToBeDealt = [self.deck objectAtIndex:0];
    [self.deck removeObjectAtIndex:0];
    
    return cardToBeDealt;
}


@end
