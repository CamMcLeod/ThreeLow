//
//  InputHandler.m
//  Maths-Game
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

+(NSString *)handle {
    // declare char
    char inputChars[255];
    // take user input for answer
    fgets(inputChars, 255, stdin);
    
    // store  char array as NSString
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    // trim whitespace and newline characters from NSString
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return trimmedString;
}

@end
