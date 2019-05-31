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
    for ( Dice * die in self.allDice) {
        if (die.currentValue != 3){
            self.currentScore += die.currentValue;
        }
    }
    return self.currentScore;
}
    
-(BOOL) actionResult: (NSString *) action {
    BOOL continueGame = YES;
    NSArray *commandWords = [action componentsSeparatedByString:@" "];
    if ([commandWords[0] isEqualToString: @"hold"]) {
        // check if user added numbers to command so doesn't break program
        if([commandWords count] > 1) {
            // adds or removes die from hold depending on index given
            NSString *heldDice = commandWords[1];
            [self holdDie: heldDice];
        }
    }
    else if ([commandWords[0] isEqualToString:@"reset"]) {
        // unhold all dice
        [self resetDice];
        // print values
    }
    else if ([commandWords[0] isEqualToString:@"roll"]) {
        // check hold list
        if ([self.heldDice count]) {
            // go through all dice
            for (int i = 0; i < NUMDICE ; i++) {
                //if held dice has this dice from all dice object...
                if(![self.heldDice containsObject: self.allDice[i] ]) {
                    // log dice as held and hold
                    [self.allDice[i] randomize];
                }
            }
        } else {
            // else log all dice as free and re-roll all
            for (int i = 0; i < NUMDICE ; i++) {
                [self.allDice[i] randomize];
            }
        
        }
    }else if ([commandWords[0] isEqualToString:@"quit"]) {
        continueGame = NO;
    }
    NSLog(@"current score: %ld", [self calculateScore]);
    return continueGame;
}

-(void) displayDice {
    
    NSMutableString *heldBuffer = [[NSMutableString alloc] init];
    NSMutableString *allBuffer = [[NSMutableString alloc] init];
    //buffer held row
    if ([self.heldDice count]) {
        // go through all dice]
        for (int i = 0; i < NUMDICE ; i++) {
            //if held dice has this dice from all dice object...
            if([self.heldDice containsObject: self.allDice[i] ]) {
                // put symbol in position
                [heldBuffer appendString:[self.allDice[i] currentSymbol]];
                [allBuffer appendString:@" "];
            } else {
                // else put space in position
                [heldBuffer appendString:@" "];
                [allBuffer appendString:[self.allDice[i] currentSymbol]];
            }
        }
    } else {
        // else log all dice as free and re-roll all
        for (int i = 0; i < NUMDICE ; i++) {
            [allBuffer appendString:[self.allDice[i] currentSymbol]];
        }
        
    }
    NSLog(@"Held dice:%@", heldBuffer);
    NSLog(@"Free dice:%@", allBuffer);
}

@end

