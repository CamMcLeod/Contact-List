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

@end
