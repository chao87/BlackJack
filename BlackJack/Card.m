//
//  Card.m
//  BlackJack
//
//  Created by Yachao Liu on 7/28/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize cardRank, cardSuit, imageURL;

//- (Card *) initWithRank:(enum Rank)r suit:(enum Suit)s
//{
//    
//}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (Card *) initWithRankAndSuit: (Rank) r suit: (Suit) s
{
    self = [super init];
    if (self) {
        self.cardRank = r;
        self.cardSuit = s;
    }
    
    return self;
}

- (Card *) initWithProperties:(Rank)r suit:(Suit)s url:(NSString *)image
{
    self = [super init];
    if (self) {
        self.cardRank = r;
        self.cardSuit = s;
        self.imageURL = image;
    }
    
    return self;
}

- (NSString *) convertRankToString: (Rank) r
{
//    NSDictionary *ranks = [NSDictionary dictionaryWithObjectsAndKeys:
//                           @"ONE", [NSNumber numberWithInt:ONE],
//                           @"TWO", [NSNumber numberWithInt:TWO],
//                           @"THREE", [NSNumber numberWithInt:THREE],
//                           @"FOUR", [NSNumber numberWithInt:FOUR],
//                           @"FIVE", [NSNumber numberWithInt:FIVE],
//                           @"SIX", [NSNumber numberWithInt:SIX],
//                           @"SEVEN", [NSNumber numberWithInt:SEVEN],
//                           @"EIGHT", [NSNumber numberWithInt:EIGHT],
//                           @"NINE", [NSNumber numberWithInt:NINE],
//                           @"TEN", [NSNumber numberWithInt:TEN],
//                           @"JACK", [NSNumber numberWithInt:TEN],
//                           @"QUEEN", [NSNumber numberWithInt:TEN],
//                           @"KING", [NSNumber numberWithInt:TEN],
//                           nil];
    
//    NSDictionary *ranks = [NSDictionary dictionaryWithObjectsAndKeys:
//                           [NSNumber numberWithInt:ONE], @"ONE", 
//                           [NSNumber numberWithInt:TWO], @"TWO", 
//                           [NSNumber numberWithInt:THREE], @"THREE",
//                           [NSNumber numberWithInt:FOUR], @"FOUR",
//                           [NSNumber numberWithInt:FIVE], @"FIVE",
//                           [NSNumber numberWithInt:SIX], @"SIX",
//                           [NSNumber numberWithInt:SEVEN], @"SEVEN",
//                           [NSNumber numberWithInt:EIGHT], @"EIGHT",
//                           [NSNumber numberWithInt:NINE], @"NINE",
//                           [NSNumber numberWithInt:TEN], @"TEN",
//                           [NSNumber numberWithInt:TEN], @"JACK",
//                           [NSNumber numberWithInt:TEN], @"QUEEN",
//                           [NSNumber numberWithInt:TEN], @"KING",
//                           nil];
//
//    
//    return [ranks objectForKey: r];

    NSArray *rankArray = [[NSArray alloc] initWithObjects:RankArray];
    return [[rankArray objectAtIndex:r] lowercaseString];
}

- (Rank) convertStringToRank: (NSString *) r
{
    NSArray *rankArray = [[NSArray alloc] initWithObjects:RankArray];
    NSUInteger n = [rankArray indexOfObject:r];
    
    return (Rank) n;
}

- (NSString *) convertSuitToString:(Suit)s
{
    NSArray *suitArray = [[NSArray alloc] initWithObjects:SuitArray];
    return [[suitArray objectAtIndex:s] lowercaseString];
}








@end
