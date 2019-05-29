//
//  Contact.h
//  Contact-List
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;
@property NSMutableDictionary *phone;

@end

NS_ASSUME_NONNULL_END
