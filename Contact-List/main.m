//
//  main.m
//  Contact-List
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL stayOn = YES;
        ContactList *fullList = [[ContactList alloc] init];
        
        while(stayOn) {
            // initialize input collector
            InputCollector *mainCollector = [[InputCollector alloc] init];
            
            // show main menu, application options, and record input
            NSString *userInput = [mainCollector inputForPrompt:@"What would you like do next? \nnew - Create a new contact \nlist - List all contacts \nquit - Exit Application > _"];
            
            // if they typed in new, create a new contact
            if([userInput compare: @"new"] == NSOrderedSame) {
                //create new contact with name and email
                Contact *newContact = [[Contact alloc] init];
                newContact.name = [mainCollector inputForPrompt:@"Enter the contact name:"];
                newContact.email = [mainCollector inputForPrompt:@"Enter the contact email address:"];
                [fullList addContact: newContact];
            }
            else if ([userInput compare: @"list"] == NSOrderedSame) {
                //list all current contacts
                [fullList list];
            }
            else if([userInput compare: @"quit"] == NSOrderedSame) {
                stayOn = NO;
                NSLog(@"Byeeeeeeee");
        
            }
            
        }
    }
    return 0;
}
