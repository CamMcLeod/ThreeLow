//
//  Dice.m
//  Threelow
//
//  Created by Cameron Mcleod on 2019-05-29.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "Dice.h"

@interface Dice()

@property NSDictionary * symbols;

@end

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _symbols = @{@"1" : @"⚀",
                     @"2" : @"⚁",
                     @"3" : @"⚂",
                     @"4" : @"⚃",
                     @"5" : @"⚄",
                     @"6" : @"⚅" };
        _currentValue = arc4random_uniform(6) + 1;
        _currentSymbol = [_symbols objectForKey: [NSString stringWithFormat: @"%d", _currentValue]];
    }
    return self;
}

-(void) randomize {
    
    // "re-roll the dice to change currentValue
    _currentValue = arc4random_uniform(6) + 1;
    _currentSymbol = [_symbols objectForKey: [NSString stringWithFormat: @"%d", _currentValue]];
}

@end
