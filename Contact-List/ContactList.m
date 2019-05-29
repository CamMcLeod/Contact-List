//
//  ContactList.m
//  Contact-List
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contacts = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addContact:(Contact *)newContact {
    // add contact to list
    //check if contact exists
    BOOL contactAvailable = YES;
    for ( int i = 0; i < [self.contacts count]; i++ ) {
        if ([[self.contacts[i] email] compare: newContact.email ] == NSOrderedSame) {
            printf("contact already exists and could not be created\n");
            //create dummy prompt to pause
            char inputChars[2];
            // take user dummy input
            fgets(inputChars, 2, stdin);
            contactAvailable = NO;
        }
    }
    
    if(contactAvailable){
        // add new contact to list
        [self.contacts addObject: newContact];
    }
}

-(void)list {
    // iterate through all contacts to list names in format "#: <full name> ()"
    
    for ( int i = 0; i < [self.contacts count]; i++ ) {
        const char *charName = {[[self.contacts[i] name] UTF8String]};
        printf("%i: <%s> ()\n", i , charName);
    }
    
//    int contactNum = 0;
//    for (Contact *thisContact in self.contacts) {
//        const char *charName = {[thisContact.name UTF8String]};
//        printf("%i: <%s> ()\n", contactNum, charName);
//        contactNum++;
//    }
    
    //create dummy prompt to pause
    char inputChars[2];
    // take user dummy input
    fgets(inputChars, 2, stdin);
}

-(void) show: (NSString *) index {
    //check to make sure index is an integer
    if ([index intValue]+1 ) {
        
        //check to make sure index given is within contacts range
        int indexGiven = [index intValue];
        if(indexGiven < [self.contacts count]) {
            // extract names and emails to char to print on printf
            const char *charName = {[[self.contacts[indexGiven] name] UTF8String]};
            printf("%i: name - <%s> ()\n", indexGiven , charName);
            const char *charEmail = {[[self.contacts[indexGiven] email] UTF8String]};
            printf("%i: email - <%s> ()\n", indexGiven , charEmail);
            
            //create dummy prompt to pause
            char inputChars[2];
            // take user dummy input
            fgets(inputChars, 2, stdin);
            
        } else {
            printf("not found\n");
            
            //create dummy prompt to pause
            char inputChars[2];
            // take user dummy input
            fgets(inputChars, 2, stdin);
            
        }
    } else {
        printf("index was not valid\n");
        //create dummy prompt to pause
        char inputChars[2];
        // take user dummy input
        fgets(inputChars, 2, stdin);
        
    }
}

-(void) find: (NSString *) term {
    // iterate through all contacts to find search term in contacts"
    for ( int i = 0; i < [self.contacts count]; i++ ) {
        // check for term in names and emails
        if ([[self.contacts[i] name] containsString: term] || [[self.contacts[i] email] containsString: term]) {
            // print out contact information for matching contacts
            const char *charName = {[[self.contacts[i] name] UTF8String]};
            const char *charEmail = {[[self.contacts[i] email] UTF8String]};
            printf("%i: <%s> (%s)\n", i , charName, charEmail);
            
            //create dummy prompt to pause
            char inputChars[2];
            // take user dummy input
            fgets(inputChars, 2, stdin);
        }
        
    }
}

@end
