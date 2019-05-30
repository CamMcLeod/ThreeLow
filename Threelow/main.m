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
            
            if ([userInput hasPrefix: @"hold"]) {
                if ([userInput length] >4) {
                    // adds or removes die from hold depending on index given
                    NSString *heldDice = [userInput substringFromIndex: 5];
                    [gameController holdDie: heldDice];
                    
                    // prints out all dice showing holds
                    
                    NSArray *holdList = [gameController.heldDice allKeys];
                    NSMutableString *holdString = [[NSMutableString alloc] init];
                    
                    for ( NSString * leString in holdList) {
                        [holdString appendString:leString];
                    }
                    
                    for (int i = 0; i < 5 ; i++) {
                        if ([gameController.heldDice count]) {
                            if ( [holdString localizedStandardContainsString: [NSString stringWithFormat: @"%d", i]]) {
                                
                                NSLog(@"[%d]", [gameController.allDice[i] currentValue]);
                            }
                            else {
                                NSLog(@"%d", [gameController.allDice[i] currentValue]);
                            }
                        }
                        else {
                            NSLog(@"%d", [gameController.allDice[i] currentValue]);
                        }
                    }
                }
            }
            else if ([userInput compare: @"reset"] == NSOrderedSame) {
                // unhold all dice
                [gameController resetDice];
                // print values
                for (Dice *die in gameController.allDice) {
                    NSLog(@"%d ", die.currentValue);
                }
            }
            else if ([userInput compare: @"roll"] == NSOrderedSame) {
                
                // check hold list
                NSArray *holdList = [gameController.heldDice allKeys];
                NSMutableString *holdString = [[NSMutableString alloc] init];
                
                for ( NSString * leString in holdList) {
                    [holdString appendString:leString];
                }
                
                for (int i = 0; i < 5 ; i++) {
                    if ([gameController.heldDice count]) {
                        if ( [holdString localizedStandardContainsString: [NSString stringWithFormat: @"%d", i]]) {
                            
                            NSLog(@"[%d]", [gameController.allDice[i] currentValue]);
                        }
                        else {
                            [gameController.allDice[i] randomize];
                            NSLog(@"%d", [gameController.allDice[i] currentValue]);
                        }
                    }
                    else {
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
