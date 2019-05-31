//
//  main.m
//  Threelow
//
//  Created by Cameron Mcleod on 2019-05-29.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"
#define NUMDICE 5

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL rollAgain = YES;
        // dice symbols: 1: ⚀ 2: ⚁ 3: ⚂ 4: ⚃ 5: ⚄ 6: ⚅
        
        // initiate instance of gamecontroller with dice
        GameController *gameController = [[GameController alloc] init];
        NSLog(@"Threelow!!! \n---RULES---\ntype <roll> to roll again\ntype <hold ###> to hold or unhold dice with the corresponding index\ntype reset to unhold all dice");
        
        while (rollAgain) {
            
            // read user input to see if they want to hold and or roll again
            NSString *userInput = [InputHandler handle];
            NSArray *commandWords = [userInput componentsSeparatedByString:@" "];
            if ([commandWords[0] isEqualToString: @"hold"]) {
                // check if user added numbers to command so doesn't break program
                if([commandWords count] > 1) {
                    // adds or removes die from hold depending on index given
                    NSString *heldDice = commandWords[1];
                    [gameController holdDie: heldDice];
                    //if there are held dice check for which ones...
                    if ([gameController.heldDice count]) {
                        // go through all dice
                        for (int i = 0; i < NUMDICE ; i++) {
                            //if held dice has this dice from all dice object...
                            if([gameController.heldDice containsObject: gameController.allDice[i] ]) {
                                // log dice as held
                                NSLog(@"[%d]", [gameController.allDice[i] currentValue]);
                            } else {
                                // else log as free
                                NSLog(@"%d", [gameController.allDice[i] currentValue]);
                            }
                        }
                    } else {
                        // else log all dice as free
                        for (int i = 0; i < NUMDICE ; i++) {
                            NSLog(@"%d", [gameController.allDice[i] currentValue]);
                        }
                    }
                }
                NSLog(@"current score: %ld", [gameController calculateScore]);
            }
            else if ([commandWords[0] isEqualToString:@"reset"]) {
                // unhold all dice
                [gameController resetDice];
                // print values
                for (Dice *die in gameController.allDice) {
                    NSLog(@"%d ", die.currentValue);
                }
            }
            else if ([commandWords[0] isEqualToString:@"roll"]) {
                // check hold list
                if ([gameController.heldDice count]) {
                    // go through all dice
                    for (int i = 0; i < NUMDICE ; i++) {
                        //if held dice has this dice from all dice object...
                        if([gameController.heldDice containsObject: gameController.allDice[i] ]) {
                            // log dice as held and hold
                            NSLog(@"[%d]", [gameController.allDice[i] currentValue]);
                        } else {
                            // else log as free and re-roll
                            [gameController.allDice[i] randomize];
                            NSLog(@"%d", [gameController.allDice[i] currentValue]);
                        }
                    }
                } else {
                    // else log all dice as free and re-roll all
                    for (int i = 0; i < NUMDICE ; i++) {
                        [gameController.allDice[i] randomize];
                        NSLog(@"%d", [gameController.allDice[i] currentValue]);
                    }
                }
                NSLog(@"current score: %ld", [gameController calculateScore]);
            }
        }
    }
    return 0;
}
