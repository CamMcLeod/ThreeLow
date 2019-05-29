//
//  Dice.m
//  Threelow
//
//  Created by Cameron Mcleod on 2019-05-29.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _currentValue = arc4random_uniform(6) + 1;
    }
    return self;
}


-(void) randomize {
    
    // "re-roll the dice to change currentValue
    _currentValue = arc4random_uniform(6) + 1;
}

@end
