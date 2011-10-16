//
//  Card.h
//  BlackJack
//
//  Created by Yachao Liu on 7/28/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    ONE = 1,
    TWO,
    THREE,
    FOUR,
    FIVE,
    SIX,
    SEVEN,
    EIGHT,
    NINE,
    TEN,
    JACK,
    QUEEN,
    KING,
} Rank;
#define RankArray @"FILLER", @"ONE", @"TWO", @"THREE", @"FOUR", @"FIVE", @"SIX", @"SEVEN", @"EIGHT", @"NINE", @"TEN", @"JACK", @"QUEEN", @"KING", nil 

typedef enum
{
    DIAMOND,
    CLUB,
    HEART,
    SPADE,
} Suit;
#define SuitArray @"DIAMOND", @"CLUB", @"HEART", @"SPADE", nil

//typedef enum Rank CardRanks;

@interface Card : NSObject
{
    Rank cardRank;
    Suit cardSuit;
    NSString *imageURL;
}

@property (nonatomic) Rank cardRank;
@property (nonatomic) Suit cardSuit;
@property (retain, nonatomic) NSString *imageURL;

- (NSString *) convertRankToString: (Rank) r;
- (Rank) convertStringToRank: (NSString *) r;

- (NSString *) convertSuitToString: (Suit) s;
//- (Rank) convertStringToSuit: (NSString *) s;


- (Card *) initWithRankAndSuit: (Rank) r suit: (Suit) s;
- (Card *) initWithProperties: (Rank) r suit: (Suit) s url: (NSString *) image;

@end







