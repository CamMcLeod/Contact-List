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

@end
