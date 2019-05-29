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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        BOOL gameOn = YES;
//
//        do {
        
            BOOL rollAgain = YES;
            // dice symbols: 1: ⚀ 2: ⚁ 3: ⚂ 4: ⚃ 5: ⚄ 6: ⚅
            
            // make 5 instances of dice
            Dice *dice1 = [[Dice alloc] init];
            Dice *dice2 = [[Dice alloc] init];
            Dice *dice3 = [[Dice alloc] init];
            Dice *dice4 = [[Dice alloc] init];
            Dice *dice5 = [[Dice alloc] init];
        
            NSMutableArray *allDice = [[NSMutableArray alloc] initWithObjects: dice1, dice2, dice3, dice4, dice5, nil];
            NSMutableSet *heldDice = [[NSMutableSet alloc] init];
            heldDice = [NSMutableSet setWithArray:allDice];
        
            do {
                //randomize values for dice
                for (Dice *dice in allDice) {
                    [dice randomize];
                }
                
                // print values for five dice
                NSLog(@"Values for five dice: %d, %d, %d, %d, %d", dice1.currentValue, dice2.currentValue, dice3.currentValue, dice4.currentValue, dice5.currentValue);
                //read user input to see if they want to roll again
                NSString *userInput = [InputHandler handle];
            
                rollAgain = [userInput compare: @"roll"] == NSOrderedSame ? YES : NO;
                
            } while (rollAgain);
            
//        } while  (gameOn);
//
    }
    return 0;
}
