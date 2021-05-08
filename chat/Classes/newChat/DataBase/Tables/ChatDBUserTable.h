//
//  ChatDBUserTable.h
//  chat
//
//  Created by jian cao on 2021/4/25.
//
#import "Foundation/Foundation.h"
#import "ChatDBTableBase.h"
#import "ChatDBUserRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatDBUserTable : ChatDBTableBase
- (BOOL)insertRecord:(ChatDBUserRecord *)record;
- (NSArray<ChatDBUserRecord *> *)recordWithPredicate:(ChatDBPredicate *)predicate;
@end

NS_ASSUME_NONNULL_END
