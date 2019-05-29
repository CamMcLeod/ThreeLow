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
            Dice *Dice1 = [[Dice alloc] init];
            Dice *Dice2 = [[Dice alloc] init];
            Dice *Dice3 = [[Dice alloc] init];
            Dice *Dice4 = [[Dice alloc] init];
            Dice *Dice5 = [[Dice alloc] init];
            
            do {
                //randomize values for five dice
                [Dice1 randomize];
                [Dice2 randomize];
                [Dice3 randomize];
                [Dice4 randomize];
                [Dice5 randomize];
                
                // print values for five dice
                NSLog(@"Values for five dice: %d, %d, %d, %d, %d", Dice1.currentValue, Dice2.currentValue, Dice3.currentValue, Dice4.currentValue, Dice5.currentValue);
                //read user input to see if they want to roll again
                NSString *userInput = [InputHandler handle];
            
                rollAgain = [userInput compare: @"roll"] == NSOrderedSame ? YES : NO;
                
            } while (rollAgain);
            
//        } while  (gameOn);
//
    }
    return 0;
}
