//
//  GameController.m
//  Threelow
//
//  Created by Cameron Mcleod on 2019-05-29.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#define NUMDICE 5

@implementation GameController

- (instancetype)init {
    if (self = [super init]) {
        
        // initialize dice array and held dice set
        _allDice = [[NSMutableArray alloc] init];
        _heldDice = [[NSMutableArray alloc] init];
        
        // make 5 instances of dice in game controller array
        for(int i =0; i< NUMDICE; i++) {
            [self.allDice addObject: [[Dice alloc]init ]];
        }

        
    }
    return self;
}

-(void) holdDie: (NSString *)diceIndexes {

    for (int i = 0; i < NUMDICE; i++) {
        
        if ([diceIndexes containsString: [NSString stringWithFormat: @"%d", i]]) {
            Dice * die = self.allDice[i];
            if([self.heldDice containsObject: die ]) {
                [self.heldDice removeObject: die];
            } else {
                [self.heldDice addObject: self.allDice[i]];
            }
        }
    }
}

-(void) resetDice {
    [self.heldDice removeAllObjects];
}

-(NSInteger)calculateScore {
    self.currentScore = 0;
    for ( Dice * die in self.heldDice) {
        if(!(die.currentValue == 3)) {
            self.currentScore += die.currentValue;
        }
    }
    return self.currentScore;
}
    
-(NSArray *) actionResult: (NSString *) action {
    
    return @[@"1"];
}

@end
