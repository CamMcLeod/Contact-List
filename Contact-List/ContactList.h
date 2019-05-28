//
//  ContactList.h
//  Contact-List
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property NSMutableArray *contacts;

-(void)addContact:(Contact *)newContact;

@end

NS_ASSUME_NONNULL_END
