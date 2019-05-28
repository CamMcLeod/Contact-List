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
    [self.contacts addObject: newContact];
}

-(void)list {
    // iterate through all contacts to list names in format "#: <full name> ()"
    int contactNum = 0;
    for (Contact *thisContact in self.contacts) {
        const char *charName = {[thisContact.name UTF8String]};
        printf("%i: <%s> ()\n", contactNum, charName);
        contactNum++;
    }
    //create dummy prompt to pause
    char inputChars[2];
    // take user dummy input
    fgets(inputChars, 2, stdin);
}

@end
