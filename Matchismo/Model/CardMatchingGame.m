#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

// might want to make these configurable in HW
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.unplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        int points = matchScore * MATCH_BONUS;
                        card.unplayable = YES;
                        otherCard.unplayable = YES;
                        self.score += points;
                        self.status = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, otherCard.contents, points];
                    } else {
                        int points = MISMATCH_PENALTY;
                        otherCard.faceUp = NO;
                        self.score -= points;
                        self.status = [NSString stringWithFormat:@"%@ & %@ don't match! %d point penalty!", card.contents, otherCard.contents, points];
                    }
                    break;
                } else {
                    self.status = [NSString stringWithFormat:@"Flipped up %@", card.contents];
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
            } else {
                break;
            }
        }
    }
    
    return self;
}

@end
