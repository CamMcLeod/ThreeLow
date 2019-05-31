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
        
        // initiate instance of gamecontroller with NUMDICE dice
        GameController *gameController = [[GameController alloc] init];
        NSLog(@"Threelow!!! \n---RULES---\ntype <roll> to roll again\ntype <hold ###> to hold or unhold dice with the corresponding index\ntype reset to unhold all dice\nheld dice appear on upper row");
        
        while (rollAgain) {
            
            // read user input to see if they want to hold and or roll again, reset or unhold
            NSString *userInput = [InputHandler handle];
            // report current state of dice and score
            rollAgain = [gameController actionResult:userInput];
            [gameController displayDice];
        }
    }
    return 0;
}
