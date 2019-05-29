//
//  InputCollector.m
//  Contact-List
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "InputCollector.h"
#import "InputHandler.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString {
    
    // display prompt
    NSLog(@"%@", promptString);
    // return input string handled using InputHandler
    return [InputHandler handle];
}

-(NSMutableDictionary *)inputForPhone:(NSString *)promptString; {
    // display prompt
    NSLog(@"%@", promptString);
    // return input string handled using InputHandler
    // declare char
    char inputChars[255];
    // take user input for answer
    fgets(inputChars, 255, stdin);
    
    // store  char array as NSString
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];

    // trim whitespace and newline characters from NSString
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray *listItems =[trimmedString componentsSeparatedByString:@" "];
    
    NSMutableDictionary *splitDict = [[NSMutableDictionary alloc] init];
    
    for(int i = 0; i < [listItems count] ; i= i + 2) {
        [splitDict setObject:listItems[i] forKey:listItems[i+1]];
    }
    
    return splitDict;
}

@end
