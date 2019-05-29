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

- (instancetype)init
{
    self = [super init];
    if (self) {
        _history = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString {
    
    // display prompt
    NSLog(@"%@", promptString);
    // return input string handled using InputHandler
    NSString *inputString = [InputHandler handle];
    [self.history addObject:inputString];
    
    return inputString;
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
    [self.history addObject:trimmedString];
    
    NSArray *listItems =[trimmedString componentsSeparatedByString:@" "];
    
    NSMutableDictionary *splitDict = [[NSMutableDictionary alloc] init];
    
    for(int i = 0; i < [listItems count] ; i= i + 2) {
        [splitDict setObject:listItems[i] forKey:listItems[i+1]];
    }
    
    return splitDict;
}

-(void)showHistory {
    //show history
    if ([self.history count] < 3) {
        for ( int i = 0; i < 2; i++ ) {
            const char *charHist = {[self.history[i] UTF8String]};
            printf("%s\n", charHist);
        }
    } else {
        for ( int i = ((int)[self.history count] - 3); i < [self.history count]; i++ ) {
            const char *charHist = {[self.history[i] UTF8String]};
            printf("%s\n", charHist);
        }
    }
    //create dummy prompt to pause
    char inputChars[2];
    // take user dummy input
    fgets(inputChars, 2, stdin);
}


@end
