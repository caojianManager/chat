//
//  ChatDBOneChatTable.h
//  chat
//
//  Created by jian cao on 2021/4/28.
//

#import <Foundation/Foundation.h>
#import "ChatDBTableBase.h"
#import "ChatDBOneChatRecord.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChatDBOneChatTable : ChatDBTableBase
- (BOOL)insertRecord:(ChatDBOneChatRecord *)record;
- (NSArray<ChatDBOneChatRecord *> *)recordWithPredicate:(ChatDBPredicate *)predicate;
@end

NS_ASSUME_NONNULL_END
