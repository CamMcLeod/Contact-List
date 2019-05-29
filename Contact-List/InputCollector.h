//
//  InputCollector.h
//  Contact-List
//
//  Created by Cameron Mcleod on 2019-05-28.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

@property NSMutableArray *history;

-(NSString *)inputForPrompt:(NSString *)promptString;
-(NSMutableDictionary *)inputForPhone:(NSString *)promptString;

-(void)showHistory;

@end

NS_ASSUME_NONNULL_END
