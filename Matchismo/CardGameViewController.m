//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Ben Burton on 4/3/13.
//  Copyright (c) 2013 Ben Burton. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;

@end

@implementation CardGameViewController

- (PlayingCardDeck *) deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}


- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.flipCount++;
    if (self.deck) {
        [sender setTitle: [[self.deck drawRandomCard] contents] forState: UIControlStateSelected];
    }
}

@end
