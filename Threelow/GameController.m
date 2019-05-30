//
//  GameController.m
//  Threelow
//
//  Created by Cameron Mcleod on 2019-05-29.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init {
    if (self = [super init]) {
        
        // initialize dice array and held dice set
        _allDice = [[NSMutableArray alloc] init];
        _heldDice = [[NSMutableDictionary alloc] init];
        _currentScore = 0;
        
        // make 5 instances of dice in game controller array
        for(int i =0; i<5 ; i++) {
            [self.allDice addObject: [[Dice alloc]init ]];
        }

        
    }
    return self;
}

-(void) holdDie: (NSString *)diceIndexes {
    
    for (int i = 0; i < 5 ; i++) {
        if ([diceIndexes containsString: [NSString stringWithFormat: @"%d", i]]) {
            if ([self.heldDice objectForKey: [NSString stringWithFormat: @"%d", i]]) {
                [self.heldDice removeObjectForKey: [NSString stringWithFormat: @"%d", i]];
            } else {
                [self.heldDice setObject:self.allDice[i] forKey:[NSString stringWithFormat: @"%d", i]];
            }
        }
    }
}

-(void) resetDice {
    [self.heldDice removeAllObjects];
}

@end
