//
//  Player.h
//  BlackJack
//
//  Created by Yachao Liu on 8/4/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Player : NSObject
{
    NSString *name;
    NSMutableArray *hand;
}

@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSMutableArray *hand;


- (Player*) initWithName: (NSString *) pName;
- (void) addCardToHand: (Card *) c;
- (void) clearHand;
- (int) handTotal;

@end
