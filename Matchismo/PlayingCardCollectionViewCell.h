//
//  PlayingCardCollectionViewCell.h
//  Matchismo
//
//  Created by Ben Burton on 4/8/13.
//  Copyright (c) 2013 Ben Burton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@end
