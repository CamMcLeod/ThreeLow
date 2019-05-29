//
//  main.m
//  Threelow
//
//  Created by Cameron Mcleod on 2019-05-29.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL gameOn = YES;
        char dummy[2];
        do {
            // dice symbols: 1: ⚀ 2: ⚁ 3: ⚂ 4: ⚃ 5: ⚄ 6: ⚅
            
            // make 5 instances of dice and print random values
            Dice *Dice1 = [[Dice alloc] init];
            Dice *Dice2 = [[Dice alloc] init];
            Dice *Dice3 = [[Dice alloc] init];
            Dice *Dice4 = [[Dice alloc] init];
            Dice *Dice5 = [[Dice alloc] init];
            
            NSLog(@"Values for five dice: %d, %d, %d, %d, %d", Dice1.currentValue, Dice2.currentValue, Dice3.currentValue, Dice4.currentValue, Dice5.currentValue);
            
            fgets(dummy, 2, stdin);
            
        } while (gameOn);
        
    }
    return 0;
}
