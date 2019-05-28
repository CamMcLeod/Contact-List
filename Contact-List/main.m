//
//  main.m
//  Contact-List
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL stayOn = YES;
        
        while(stayOn) {
            // initialize input collector
            NSLog(@"What would you like do next? \nnew - Create a new contact \nlist - List all contacts \nquit - Exit Application > _");
            
            
            
            InputCollector *newCollector = [[InputCollector alloc] init];
            
            NSString *usernameInput = [newCollector inputForPrompt:@"Enter your username"];
            
            // if they typed in quit, exit the game
            if([usernameInput compare: @"quit"] == NSOrderedSame) {
                stayOn = NO;
            }
            
        }
    }
    return 0;
}
