//
//  BlackJackViewController.h
//  BlackJack
//
//  Created by Yachao Liu on 7/27/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardDeck.h"
#import "Player.h"

@interface BlackJackViewController : UIViewController 
{
    UIImageView *cardDeckImage;
    IBOutlet UILabel *score;
    IBOutlet UIButton *deal;
    IBOutlet UIButton *hit;
    IBOutlet UIButton *stand;
    
    CardDeck *cardDeck;
    Player *dealer;
    Player *guest;
    
    bool gameStarted;
    bool gameEnded;
    
    int staticPos;
    int staticPos2;
    
//    UIImageView *frontCardImage;
//    UIView *containerView;
    
//    Card *dealerFirstCard;
//    Card *dealerSecondCard;
//    Card *playerFirstCard;
//    Card *playerSecondCard;
}

@property (retain, nonatomic) UIImageView *cardDeckImage;
@property (retain, nonatomic) IBOutlet UILabel *score;
@property (retain, nonatomic) IBOutlet UIButton *deal;
@property (retain, nonatomic) IBOutlet UIButton *hit;
@property (retain, nonatomic) IBOutlet UIButton *stand;

@property (retain, nonatomic) CardDeck *cardDeck;
@property (retain, nonatomic) Player *dealer;
@property (retain, nonatomic) Player *guest;

@property (nonatomic) bool gameStarted;
@property (nonatomic) bool gameEnded;

@property (nonatomic) int staticPos;
@property (nonatomic) int staticPos2;

//@property (retain, nonatomic) UIImageView *frontCardImage;
//@property (retain, nonatomic) UIView *containerView;

//@property (retain, nonatomic) Card *dealerFirstCard;
//@property (retain, nonatomic) Card *dealerSecondCard;
//@property (retain, nonatomic) Card *playerFirstCard;
//@property (retain, nonatomic) Card *playerSecondCard;


- (IBAction)dealCards:(id)sender;
- (IBAction)hitMe:(id)sender;
- (IBAction)stand:(id)sender;
- (void) dealFirstCards;
- (void) dealSecondCards;
- (void) hitDealer;

- (void) checkIfBlackjack;
- (void) showScore;
- (void) resetGame;
- (void) checkGame: (bool) checkDealer;
- (void) endGame;
//- (void) newGame;


- (void) moveDealerCard1: (UIImageView *) imageName;
//- (void) moveDealerCard2: (UIImageView *) imageName;
- (void) movePlayerCard1: (UIImageView *) imageName;
//- (void) movePlayerCard2: (UIImageView *) imageName;


//- (void) createCard;

@end
