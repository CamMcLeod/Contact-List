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
            
            // insert fake data
//
//            for (int i = 0; i <2; i++){
//                Contact *newContact = [[Contact alloc] init];
//                newContact.name =[[NSString alloc] initWithFormat:@"Raccoon Dan%d", i];
//                newContact.email = [[NSString alloc] initWithFormat:@"fishing%d@adventure.com", i];
//                [fullList addContact: newContact];
//            }
           
            
            // show main menu, application options, and record input
            NSString *userInput = [mainCollector inputForPrompt:@"What would you like do next? \nnew - Create a new contact \nlist - List all contacts \nshow - show contact with index # \nfind <term> - find contacts associated with search term \nquit - Exit Application > _"];
            
            // if they typed in new, create a new contact
            if([userInput compare: @"new"] == NSOrderedSame) {
                //create new contact with name and email
                Contact *newContact = [[Contact alloc] init];
                newContact.name = [mainCollector inputForPrompt:@"Enter the contacts name:"];
                newContact.email = [mainCollector inputForPrompt:@"Enter the contacts email address:"];
                newContact.phone = [mainCollector inputForPhone:@"Enter the contacts phone number then a space, then the label for that number (home, cell, etc...). For additional phone numbers follow with a space then the number and label:"];
                
                [fullList addContact: newContact];
            }
            else if ([userInput compare: @"list"] == NSOrderedSame) {
                //list all current contacts
                [fullList list];
            }
            else if ([userInput compare: @"show"] == NSOrderedSame) {
                //shows contact and contact details with given index
                NSString *index = [mainCollector inputForPrompt:@"Enter the contact index #:"];
                [fullList show: index];
            }
            else if ([userInput hasPrefix: @"find"]) {
                //returns a list of contacts who have the search term in their information
                NSString *searchTerm = [userInput substringFromIndex: 5];
                NSLog(@"%@", searchTerm);
                [fullList find: searchTerm];
            }
            else if([userInput compare: @"quit"] == NSOrderedSame) {
                stayOn = NO;
                NSLog(@"Byeeeeeeee");
        
            }
            
        }
    }
    return 0;
}
