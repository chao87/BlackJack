//
//  BlackJackViewController.m
//  BlackJack
//
//  Created by Yachao Liu on 7/27/11.
//  Copyright 2011 Intercall. All rights reserved.
//

#import "BlackJackViewController.h"
#import "CardDeck.h"

@implementation BlackJackViewController

@synthesize cardDeckImage, score, deal, hit, stand;
@synthesize cardDeck, dealer, guest, gameStarted, gameEnded;
@synthesize staticPos, staticPos2;
//@synthesize frontCardImage, containerView;

//- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    CGPoint touchLocation = [touch locationInView:self.view];
//    
//    CGRect cardRect = [image1 frame];
//    if(CGRectContainsPoint(cardRect, touchLocation))
//    {
//        NSLog(@"Card tapped");
//    }
//    else
//    {
//        NSLog(@"Card not tapped");
//        return;
//    }
//    
//}

- (IBAction)hitMe:(id)sender
{
    if (gameStarted) 
    {
        //score.text = @"You hit!";
        if([guest handTotal] <= 21)
        {
            //get new card
            Card *dealtCard = [cardDeck dealCard];
            [guest.hand addObject:dealtCard];
            
            UIImageView *frontImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
            frontImage.tag = 1;
            
            UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(100, 73, 100, 100)];
            containerView.tag = 1;
            
            UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dealtCard.imageURL]];
            
            [self.view addSubview:containerView];
            [containerView addSubview:frontImage];
            
            [UIView animateWithDuration:1.0
                                  delay:0.0
                                options: UIViewAnimationCurveEaseInOut
                             animations:^{
                                 
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                                 [UIView beginAnimations:nil context:NULL];
                                 [UIView setAnimationDuration:1.0];
                                 [UIView setAnimationDelay:.5];
                                 [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:containerView cache:YES];
                                 [frontImage removeFromSuperview];
                                 [containerView addSubview:backImage];
                                 [UIView commitAnimations];
                                 
                                 [NSThread sleepForTimeInterval:1];
                                 
                                 [UIView animateWithDuration:1.0
                                                       delay:1.0
                                                     options: UIViewAnimationCurveEaseInOut
                                                  animations:^{
                                                      backImage.center = CGPointMake(staticPos, 167);
                                                  }
                                                  completion:^(BOOL finished) {
                                                      [self checkGame:YES];
                                                  }];
                             }];
            
            
            //[self showScore];
            staticPos += 17;
        }
    }
}

- (void) hitDealer
{
    //get new card
    Card *dealtCard2 = [cardDeck dealCard];
    [dealer.hand addObject:dealtCard2];
    
    UIImageView *frontImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
    frontImage.tag = 1;
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(100, 73, 100, 100)];
    containerView.tag = 1;
    
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dealtCard2.imageURL]];
    
    [self.view addSubview:containerView];
    [containerView addSubview:frontImage];
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView beginAnimations:nil context:NULL];
                         [UIView setAnimationDuration:1.0];
                         [UIView setAnimationDelay:.5];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:containerView cache:YES];
                         [frontImage removeFromSuperview];
                         [containerView addSubview:backImage];
                         [UIView commitAnimations];
                         
                         [NSThread sleepForTimeInterval:1];
                         
                         [UIView animateWithDuration:1.0
                                               delay:1.0
                                             options: UIViewAnimationCurveEaseInOut
                                          animations:^{
                                              backImage.center = CGPointMake(staticPos2, -13);
                                          }
                                          completion:^(BOOL finished) {
                                              //[self checkGame:YES];
                                          }];
                     }];
    staticPos2 += 17;
}

- (IBAction)stand:(id)sender
{
    if(gameStarted)
    {
        score.text = @"You hit stand!";
        
        if([guest handTotal] <= 21)
        {
            [self hitDealer];
        }
        //[self resetGame];
    }
}

- (void) checkGame:(bool) checkDealer
{
    if(checkDealer)
    {
        if([guest handTotal] > 21)
        {
            score.text = @"You Busted!";
            [self endGame];
        }
    }
    else
    {
        if([dealer handTotal] > 21)
        {
            score.text = @"Dealer Busted! You Win!";
            [self endGame];
        }
    }
}

- (void) resetGame
{
    //remove card image views
    for(UIView* subview in [self.view subviews])
    {
        if(subview.tag == 1)
        {
            [subview removeFromSuperview];
        }
    }
    
    //set player to null
    [guest.hand removeAllObjects];
    [dealer.hand removeAllObjects];
    guest = nil;
    dealer = nil;
    
    //set carddeck null
    [cardDeck.deck removeAllObjects];
    cardDeck = nil;
    
    //set game state
    gameStarted = NO;
    gameEnded = YES;
    
    //reset score text
    score.text = @"";
}

- (void) showScore
{
    //score.text = [score.text stringByAppendingString: [NSString stringWithFormat: @"%i", [guest handTotal]]];
    NSString* guestTotal = [NSString stringWithFormat: @"%i", [guest handTotal]];
    NSString* dealerTotal = [NSString stringWithFormat: @"%i", [dealer handTotal]];
    
    NSString* result = [[NSString alloc] initWithString:@"  Guest Total is: "];
    result = [result stringByAppendingString:guestTotal];
    result = [result stringByAppendingString:@" - Dealer total is: "];
    result = [result stringByAppendingString:dealerTotal];
    
    score.text = result;
    //score.text = [score.text stringByAppendingString:result];
}

- (void) checkIfBlackjack
{
    bool dealerBlackJack = NO;
    bool guestBlackJack = NO;
    
    if( ([[dealer.hand objectAtIndex:0] cardRank] == ONE) && 
        ([[dealer.hand objectAtIndex:1] cardRank] == TEN || 
         [[dealer.hand objectAtIndex:1] cardRank] == JACK ||
         [[dealer.hand objectAtIndex:1] cardRank] == QUEEN ||
         [[dealer.hand objectAtIndex:1] cardRank] == KING))
    {
        dealerBlackJack = YES;
    }
    else if( ([[dealer.hand objectAtIndex:1] cardRank] == ONE) && 
              ([[dealer.hand objectAtIndex:0] cardRank] == TEN || 
               [[dealer.hand objectAtIndex:0] cardRank] == JACK ||
               [[dealer.hand objectAtIndex:0] cardRank] == QUEEN ||
               [[dealer.hand objectAtIndex:0] cardRank] == KING))
    {
        dealerBlackJack = YES;
    }
    
    if( ([[guest.hand objectAtIndex:0] cardRank] == ONE) && 
       ([[guest.hand objectAtIndex:1] cardRank] == TEN || 
        [[guest.hand objectAtIndex:1] cardRank] == JACK ||
        [[guest.hand objectAtIndex:1] cardRank] == QUEEN ||
        [[guest.hand objectAtIndex:1] cardRank] == KING))
    {
        guestBlackJack = YES;
    }
    else if( ([[guest.hand objectAtIndex:1] cardRank] == ONE) && 
            ([[guest.hand objectAtIndex:0] cardRank] == TEN || 
             [[guest.hand objectAtIndex:0] cardRank] == JACK ||
             [[guest.hand objectAtIndex:0] cardRank] == QUEEN ||
             [[guest.hand objectAtIndex:0] cardRank] == KING))
    {
        guestBlackJack = YES;
    }
    
    if (dealerBlackJack && guestBlackJack) 
    {
        score.text = @"Congrats on dealer and you for getting BlackJack!";
        [self showScore];
        
    }
    else if (dealerBlackJack)
    {
        score.text = @"Dealer got BlackJack!";
        [self showScore];
    }
    else if (guestBlackJack)
    {
        score.text =  @"You got BlackJack!";
        [self showScore];
    }
    else
    {
        score.text = @"No one got Blackjack!";
        [self showScore];
    }
    
    if(guestBlackJack || dealerBlackJack)
    {
        [self endGame];
    }
}

- (void) endGame
{
    gameEnded = YES;
}

- (void) dealSecondCards
{
    //deal dealer second card
    Card *dealerSecondCard = [cardDeck dealCard];
    [dealer.hand addObject:dealerSecondCard];
    
    //deal player second card
    Card *playerSecondCard = [cardDeck dealCard];
    [guest.hand addObject:playerSecondCard];
    
    UIImageView *frontImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
    frontImage.tag = 1;
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(100, 73, 100, 100)];
    containerView.tag = 1;
    
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dealerSecondCard.imageURL]];
    backImage.tag = 1;
    
    [self.view addSubview:containerView];
    [containerView addSubview:frontImage];
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView beginAnimations:nil context:NULL];
                         [UIView setAnimationDuration:1.0];
                         [UIView setAnimationDelay:.5];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:containerView cache:YES];
                         [frontImage removeFromSuperview];
                         [containerView addSubview:backImage];
                         [UIView commitAnimations];
                         
                         [NSThread sleepForTimeInterval:1];
                         
                         [UIView animateWithDuration:1.0
                                               delay:1.0
                                             options: UIViewAnimationCurveEaseInOut
                                          animations:^{
                                              backImage.center = CGPointMake(170, -13);
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              [NSThread sleepForTimeInterval:1];
                                              
                                              //second
                                              UIImageView *frontImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
                                              frontImage2.tag = 1;
                                              
                                              UIView *containerView2 = [[UIView alloc] initWithFrame:CGRectMake(100, 73, 100, 100)];
                                              containerView2.tag = 1;
                                              
                                              UIImageView *backImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:playerSecondCard.imageURL]];
                                              backImage2.tag = 1;
                                              
                                              [self.view addSubview:containerView2];
                                              [containerView2 addSubview:frontImage2];
                                              
                                              
                                              [UIView animateWithDuration:1.0
                                                                    delay:0.0
                                                                  options: UIViewAnimationCurveEaseInOut
                                                               animations:^{}
                                                               completion:^(BOOL finished) {
                                                                   
                                                                   [UIView beginAnimations:nil context:NULL];
                                                                   [UIView setAnimationDuration:1.0];
                                                                   [UIView setAnimationDelay:.5];
                                                                   [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:containerView2 cache:YES];
                                                                   [frontImage2 removeFromSuperview];
                                                                   [containerView2 addSubview:backImage2];
                                                                   [UIView commitAnimations];
                                                                   
                                                                   [NSThread sleepForTimeInterval:1];
                                                                   
                                                                   [UIView animateWithDuration:1.0
                                                                                         delay:1.0
                                                                                       options: UIViewAnimationCurveEaseInOut
                                                                                    animations:^{
                                                                                        backImage2.center = CGPointMake(170, 167);
                                                                                    }
                                                                                    completion:^(BOOL finished) {
                                                                                        
                                                                                        [self checkIfBlackjack];
                                                                                        
                                                                                        
                                                                                    }];
                                                               }];
                                              
                                          }];
                     }];
    
    
}

- (void) dealFirstCards
{
    //deal dealer first card
    Card *dealerFirstCard = [cardDeck dealCard];
    [dealer.hand addObject:dealerFirstCard];
    
    UIImageView *dealerCardView1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 90, 64, 64)];
    dealerCardView1.image = [UIImage imageNamed:@"back.png"];
    dealerCardView1.contentMode = UIViewContentModeCenter;
    //set tag value so we can identify it when we need to remove it for reset game
    dealerCardView1.tag = 1;
    [self.view addSubview:dealerCardView1];
    
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         dealerCardView1.center = CGPointMake(250, 60);
                     }
                     completion:^(BOOL finished) {
                         
                         [NSThread sleepForTimeInterval:1];
                         
                         //deal player first card
                         Card *playerFirstCard = [cardDeck dealCard];
                         [guest.hand addObject:playerFirstCard];
                         
                         
                         UIImageView *frontImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
                         frontImage.tag = 1;
                         
                         UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(100, 73, 100, 100)];
                         containerView.tag = 1;
                         
                         UIImageView *backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:playerFirstCard.imageURL]];
                         
                         [self.view addSubview:containerView];
                         [containerView addSubview:frontImage];
                         
                         [UIView animateWithDuration:1.0
                                               delay:0.0
                                             options: UIViewAnimationCurveEaseInOut
                                          animations:^{
                                              
                                              
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              [UIView beginAnimations:nil context:NULL];
                                              [UIView setAnimationDuration:1.0];
                                              [UIView setAnimationDelay:.5];
                                              [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:containerView cache:YES];
                                              [frontImage removeFromSuperview];
                                              [containerView addSubview:backImage];
                                              [UIView commitAnimations];
                                              
                                              [NSThread sleepForTimeInterval:1];
                                              
                                              [UIView animateWithDuration:1.0
                                                                    delay:1.0
                                                                  options: UIViewAnimationCurveEaseInOut
                                                               animations:^{
                                                                   backImage.center = CGPointMake(150, 167);
                                                               }
                                                               completion:^(BOOL finished) {
                                                                   [self dealSecondCards];
                                                               }];

                                              
                                          }];
                     }];
}

- (IBAction)dealCards:(id)sender
{
    if(!gameStarted && gameEnded)
    {
        gameStarted = YES;
        gameEnded = NO;
        
        staticPos = 170;
        staticPos2 = 170;
        
        //init card deck
        cardDeck = [[CardDeck alloc] init];
        [cardDeck shuffleDeck];
        
        //init players
        dealer = [[Player alloc] initWithName:@"Dealer"];
        guest = [[Player alloc] initWithName:@"Chao"];
        
        [self dealFirstCards];
    }
    else if(gameStarted && gameEnded)
    {
        [self resetGame];
        [self dealCards:self];
    }
}

- (void) moveDealerCard1:(UIImageView *)imageName
{
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         imageName.center = CGPointMake(250, 200);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (void) movePlayerCard1:(UIImageView *)imageName 
{
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         imageName.center = CGPointMake(50, 200);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set default to landscape
    [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeRight;
    CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI_2);
    [self.view setTransform:rotate];
    
    //load card deck image
    cardDeckImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 90, 64, 64)];
    cardDeckImage.image = [UIImage imageNamed:@"back.png"];
    cardDeckImage.contentMode = UIViewContentModeCenter;
    [self.view addSubview:cardDeckImage];
    
    //set game state
    gameStarted = NO;
    gameEnded = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
