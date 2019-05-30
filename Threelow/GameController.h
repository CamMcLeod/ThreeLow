//
//  GameController.h
//  Threelow
//
//  Created by Cameron Mcleod on 2019-05-29.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property NSMutableArray *allDice;
@property NSMutableDictionary *heldDice;
@property NSInteger currentScore;

-(void) holdDie: (NSString *)diceIndexes;
-(void) resetDice;
    
@end

NS_ASSUME_NONNULL_END
