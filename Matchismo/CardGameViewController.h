#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

- (Deck *)createDeck; // abstract
- (void)updateCell: (UICollectionViewCell *)cell usingCard:(Card *)card; // abstract
- (void)updateCell: (UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate; // abstract

@property (nonatomic) NSUInteger startingCardCount; // abstract

@end
